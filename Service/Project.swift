import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "Service",
    platform: .iOS,
    dependencies: [
        .project(target: "ThirdPartyLibManager", path: "../ThirdPartyLibManager")
    ]
)
