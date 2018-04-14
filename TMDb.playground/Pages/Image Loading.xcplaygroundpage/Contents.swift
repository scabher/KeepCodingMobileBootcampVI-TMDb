@testable import TMDbCore

import RxSwift
import PlaygroundSupport

// Indica que la ejecución va a ser infinita/indefinida
PlaygroundPage.current.needsIndefiniteExecution = true

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
