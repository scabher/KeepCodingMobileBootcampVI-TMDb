import TMDbCore
import RxSwift
import PlaygroundSupport
import RxCocoa

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

let randomUserImage = session.rx.data(request: URLRequest(url: randomUserApiUrl))
    .map { data -> RandomUserResponse in
        return try decoder.decode(RandomUserResponse.self, from: data)
    }
    .flatMap { response -> Observable<Data> in
        let request = URLRequest(url: response.results[0].picture.imageURL)
        return session.rx.data(request: request)
    }
    .map { data -> UIImage in
        return UIImage(data: data) ?? UIImage()
}

let disposable = randomUserImage.subscribe(onNext: { image in
    let fuckingXcode = image
    print (fuckingXcode)
}, onError: { error in
    print(error)
})
