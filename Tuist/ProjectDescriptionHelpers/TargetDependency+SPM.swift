import ProjectDescription

extension TargetDependency {
    public struct SPM {
        public static let Moya = TargetDependency.external(name: "Moya")
        public static let KeychainSwift = TargetDependency.external(name: "KeychainSwift")
        public static let CombineMoya = TargetDependency.external(name: "CombineMoya")
        public static let BSImagePicker = TargetDependency.external(name: "BSImagePicker")
    }
}
