import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies([
        // Moya
        .remote(url: "https://github.com/Moya/Moya.git",
                requirement: .upToNextMajor(from: "15.0.3")),
        // KeychainSwift
        .remote(url: "https://github.com/evgenyneu/keychain-swift",
                requirement: .upToNextMajor(from: "20.0.0")),
        // BSImagePicker
        .remote(url: "https://github.com/mikaoj/BSImagePicker.git",
                requirement: .upToNextMajor(from: "3.3.1")),
        // Introspect
        .remote(url: "https://github.com/siteline/SwiftUI-Introspect.git",
                requirement: .branch("master"))
    ]))
