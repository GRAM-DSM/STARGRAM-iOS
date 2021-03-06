import ProjectDescription

extension Project {

    public static func excutable(
        name: String,
        platform: Platform,
        product: Product = .app,
        deploymentDevice: DeploymentDevice = [.iphone, .ipad],
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            organizationName: stargramOrganizationName,
            settings: .settings(base: .codeSign),
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: product,
                    bundleId: "\(stargramOrganizationName).\(name)",
                    deploymentTarget: .iOS(
                        targetVersion: "15.5",
                        devices: deploymentDevice
                    ),
                    infoPlist: .file(path: Path("SupportingFiles/Info.plist")),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    scripts: [.swiftlint],
                    dependencies: [
                        .project(target: "ThirdPartyLibManager", path: "../ThirdPartyLibManager")
                    ] + dependencies
                )
            ]
        )
    }

}
