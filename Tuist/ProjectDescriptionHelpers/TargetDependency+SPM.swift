import ProjectDescription

extension TargetDependency {
    public struct SPM {
        public static let RxSwift = TargetDependency.package(product: "RxSwift")
        public static let Moya = TargetDependency.package(product: "Moya")
        public static let KeychainSwift = TargetDependency.package(product: "KeychainSwift")
        public static let RxMoya = TargetDependency.package(product: "RxMoya")
    }
}

public extension Package {

    // RxSwift
    static let RxSwift = Package.remote(
        url: "https://github.com/ReactiveX/RxSwift",
        requirement: .upToNextMajor(from: "6.5.0")
    )
    // Moya
    static let Moya = Package.remote(
        url: "https://github.com/Moya/Moya.git",
        requirement: .upToNextMajor(from: "15.0.0")
    )
    // KeychainSwift
    static let KeychainSwift = Package.remote(
        url: "https://github.com/evgenyneu/keychain-swift",
        requirement: .upToNextMajor(from: "20.0.0")
    )

}
