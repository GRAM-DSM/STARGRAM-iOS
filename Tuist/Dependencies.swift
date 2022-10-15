import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies([
        // Moya
        .remote(url: "https://github.com/Moya/Moya.git",
                requirement: .upToNextMajor(from: "15.0.3")),
        // KeychainSwift
        .remote(url: "https://github.com/evgenyneu/keychain-swift",
                requirement: .upToNextMajor(from: "20.0.0"))
    ]))
