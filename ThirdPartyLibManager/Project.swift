import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "ThirdPartyLibManager",
    dependencies: [
        .SPM.RxSwift,
        .SPM.Moya,
        .SPM.KeychainSwift,
        .SPM.RxMoya
    ]
)
