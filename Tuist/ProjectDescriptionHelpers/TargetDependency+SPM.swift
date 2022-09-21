import ProjectDescription

extension TargetDependency {
    public struct SPM {
        public static let RxSwift = TargetDependency.external(name: "RxSwift")
        public static let Moya = TargetDependency.external(name: "Moya")
        public static let KeychainSwift = TargetDependency.external(name: "KeychainSwift")
        public static let RxMoya = TargetDependency.external(name: "RxMoya")
    }
}
