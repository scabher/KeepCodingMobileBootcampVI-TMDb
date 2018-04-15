import TMDbCore
import RxSwift
import PlaygroundSupport

// Indica que la ejecución va a ser infinita/indefinida
PlaygroundPage.current.needsIndefiniteExecution = true

// Decodable para transformar el JSON en un objeto.
// Se debe poner en todas las structs que hayan
struct RandomUserResponse: Decodable {
    struct User: Decodable {
        struct Name: Decodable {
            let title: String
            let first: String
            let last: String
        }
        
        struct Picture: Decodable {
            let imageURL: URL
            
            // Para asociar una propiedad JSON a la del struct con nombres distintos
            private enum CodingKeys: String, CodingKey {
                case imageURL = "large"
            }
        }
        
        let name: Name
        let picture: Picture
    }
    
    let results: [User]
}

let randomUserApiUrl = URL(string: "https://randomuser.me/api")!
let session = URLSession(configuration: .default)
let decoder = JSONDecoder()

func data(with url: URL) -> Observable<Data> {
    return Observable.create { observer in
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                observer.onError(error)
            } else {
                observer.onNext(data ?? Data())
                observer.onCompleted()
            }
        }
        
        task.resume()
        
        // Closure que se ejecutará si la suscripción se cancela
        return Disposables.create {
            task.cancel()
        }
    }
}

// @escaping: Son funciones que se ejecutarán en el futuro y se escapan de la secuencia
// normal de ejecución.
// los callbacks son todos @escaping
func getRandomUserResponse(completion: @escaping (RandomUserResponse?, Error?) -> Void) {
    let task = session.dataTask(with: randomUserApiUrl) { data, response, error in
        if let data = data,
            let result = try? decoder.decode(RandomUserResponse.self, from: data) {
            completion(result, nil)
        } else {
            completion(nil, error)
        }
    }
    
    task.resume()
}

func getImage(for url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
    let task = session.dataTask(with: url) { data, response, error in
        if let data = data, let image = UIImage(data: data) {
            completion(image, nil)
        } else {
            completion(nil, error)
        }
    }
    task.resume()
}

func getRandomUserImage(completion: @escaping (UIImage?, Error?) -> Void {
    getRanddomUserResponse { response, error in
        guard let response = response else {
            completion(nil, error)
            return
        }
    
        getImage(for: response.results[0].picture.imageURL, completion: completion)
    }
}

let randomUserImage = data(with: randomUserApiUrl)
    .map { data -> RandomUserResponse in
        try decoder.decode(RandomUserResponse.self, from: data)
    }
    .flatMap { response -> Observable<Data> in
        data(with: response.results[0].picture.imageURL)
    }
    .map { data -> UIImage in
        UIImage(data: data) ?? UIImage()
    }

let disposable = randomUserImage.subscribe(onNext: { image in
    let fuckingXcode = image
    print (fuckingXcode)
}, onError: { error in
    print(error)
})

//getRandomUserImage { image, error in
//    if let image = image {
//        let tempImage = image
//        print(tempImage)
//    } else {
//        print(error)
//    }
//}
