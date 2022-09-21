import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies([
        // RxSwift
        .remote(url: "https://github.com/ReactiveX/RxSwift",
                requirement: .upToNextMajor(from: "6.5.0")),
        // Moya
        .remote(url: "https://github.com/Moya/Moya.git",
                requirement: .upToNextMajor(from: "15.0.3")),
        // KeychainSwift
        .remote(url: "https://github.com/evgenyneu/keychain-swift",
                requirement: .upToNextMajor(from: "20.0.0"))
    ]))
