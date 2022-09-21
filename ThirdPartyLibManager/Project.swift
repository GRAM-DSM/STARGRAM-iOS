import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "ThirdPartyLibManager",
    packages: [
        .RxSwift,
        .Moya,
        .KeychainSwift
    ],
    dependencies: [
        .SPM.RxSwift,
        .SPM.Moya,
        .SPM.KeychainSwift,
        .SPM.RxMoya
    ]
)
