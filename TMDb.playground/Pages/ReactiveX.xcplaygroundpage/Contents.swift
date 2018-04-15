import TMDbCore
import RxSwift
import PlaygroundSupport

// Indica que la ejecución va a ser infinita/indefinida
PlaygroundPage.current.needsIndefiniteExecution = true

enum APIError: Error {
    case invalidKey
    case notAnImage
}

let some = Observable.from(["🤩","😎"])
let empty = Observable<Int>.empty() // Sólo emite un evento completed
let error = Observable<Int>.error(APIError.invalidKey) // Emite un error
let single = Observable.just("Holap") // Emite un valor y se completa

let hello = Observable<String>.create { observer in
    observer.onNext("Hello")
    observer.onNext("People!")
    observer.onCompleted()
    
    return Disposables.create()
}

func doSomethingInTheFuture(completion: (String) -> Void) {
    
}

let promise = Observable<String>.create { observer in
    observer.onNext("Hello")
    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
        observer.onNext("Five seconds later")
        observer.onCompleted()
    })
    
    return Disposables.create()
}

promise.subscribe { (event) in
    switch event {
    case .next (let value):
        print("next(\(value))")
    case .error (let error):
        print("error(\(error))")
    case .completed:
        print("completed")
    }
}
