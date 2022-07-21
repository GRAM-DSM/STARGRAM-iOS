import ProjectDescription

extension TargetScript {
    static let swiftlint = TargetScript.pre(
        script: "../Scripts/SwiftLintRunScript",
        name: "SwiftLint"
    )
}
