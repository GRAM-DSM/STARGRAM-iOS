import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies([
        .remote(
            url: "https://github.com/ReactiveX/RxSwift.git",
            requirement: .exact("6.5.0")
        ),
        .remote(
            url: "https://github.com/Moya/Moya.git",
            requirement: .upToNextMajor(from: "15.0.0")
        ),
        .remote(
            url: "https://github.com/evgenyneu/keychain-swift",
            requirement: .upToNextMajor(from: "20.0.0")
        )
    ]),
    platforms: [.iOS]
)
