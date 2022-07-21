import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "ThirdPartyLibManager",
    packages: [
        .RxSwift
    ],
    dependencies: [
        .SPM.RxSwift,
        .SPM.RxCocoa
    ]
)
