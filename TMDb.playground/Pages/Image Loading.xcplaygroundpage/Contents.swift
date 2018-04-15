@testable import TMDbCore

import RxSwift
import PlaygroundSupport

// Indica que la ejecución va a ser infinita/indefinida
PlaygroundPage.current.needsIndefiniteExecution = true

// Se usa para ligar el ciclo de vida de las suscripciones al objeto
// disposeBag. Como este está ligado a la clase donde está definida la variabla
// cuando se elimina la clase, se elimina disposeBag y por consiguiente
// todas las suscripciones ligadas a esta variable disposeBag.
let disposeBag = DisposeBag()

// Carga de los ensamblajes (assembly, imageLoadingAssembly e imageRepository son ensamblajes)
// Los assemblies no puedes ser dependencias de nuestros objetos
// sólo de otros assemblies para mantener la inyección de dependencias
let assembly = CoreAssembly(navigationController: UINavigationController())
let imageRepository = assembly.imageLoadingAssembly.imageRepository

imageRepository.image(at: "iTgmsxuZKOQI0tlZmTbmTZWcLwW.jpg", size: .w780)
	.subscribe(onNext: {
		let image = $0
		print(image)
	})
	.disposed(by: disposeBag)

let webService = WebService(configuration: .default)

// Para obtener la configuración del servicio
//let configuration = webService.load(Configuration.self, from: .configuration)
//    .subscribe(onNext: {
//        print($0)
//    }, onError: { error in
//        print(error)
//    })
//    .disposed(by: disposeBag)

//let pageShow = webService.load(Page<Show>.self, from: .showsOnTheAir(page: 1))
//    .subscribe(onNext: {
//        print($0)
//    }, onError: { error in
//        print(error)
//    })
//    .disposed(by: disposeBag)

// Definición de errores propios
enum TestError: Error {
    case imageNotFound
}

webService.load(Page<Show>.self, from: .showsOnTheAir(page: 1))
    .flatMap { page -> Observable<UIImage> in
        guard let backdropPath = page.results.first?.backdropPath else {
            throw TestError.imageNotFound
        }
        return imageRepository.image(at: backdropPath, size: .original)
    }
    .subscribe { event in
        switch event {
        case .next(let image):
            let stupidXcode = image
            print(stupidXcode)
        case .error(let error):
            print(error)
        case .completed:
            print("Completed")
        }
    }

