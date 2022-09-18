import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.excutable(
    name: "STARGRAM-iOS",
    platform: .iOS,
    deploymentDevice: .iphone,
    dependencies: [
        .project(target: "ThirdPartyLibManager", path: "../ThirdPartyLibManager"),
        .project(target: "Service", path: "../Service")
        ]
)
