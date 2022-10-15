import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "ThirdPartyLibManager",
    dependencies: [
        .SPM.Moya,
        .SPM.KeychainSwift,
        .SPM.CombineMoya
    ]
)
