import ProjectDescription

extension TargetDependency {
    public struct SPM { }
}

public extension TargetDependency.SPM {
    static let RxSwift = TargetDependency.package(product: "RxSwift")
    static let RxCocoa = TargetDependency.package(product: "Rxcocoa")
    static let Moya = TargetDependency.package(product: "Moya")
    static let KeychainSwift = TargetDependency.package(product: "KeychainSwift")
}

public extension Package {
    static let RxSwift = Package.remote(
        url: "https://github.com/ReactiveX/RxSwift.git",
        requirement: .exact("6.5.0")
    )
    static let Moya = Package.remote(
        url: "https://github.com/Moya/Moya.git",
        requirement: .upToNextMajor(from: "15.0.0")
    )
    static let KeychainSwift = Package.remote(
        url: "https://github.com/evgenyneu/keychain-swift",
        requirement: .upToNextMajor(from: "20.0.0")
    )
}
