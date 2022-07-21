import ProjectDescription

extension TargetDependency {
    public struct SPM { }
}

public extension TargetDependency.SPM {
    static let RxSwift = TargetDependency.package(product: "RxSwift")
    static let RxCocoa = TargetDependency.package(product: "Rxcocoa")
}

public extension Package {
    static let RxSwift = Package.remote(
        url: "https://github.com/ReactiveX/RxSwift.git",
        requirement: .exact("6.5.0")
    )
}
