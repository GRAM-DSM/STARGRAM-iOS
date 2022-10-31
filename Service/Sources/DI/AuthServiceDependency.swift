import Foundation

public struct AuthServiceDependency {
    public let checkIdUseCase: CheckIdUseCase
    public let checkVerificationEmailUseCase: CheckVerificationEmailUseCase
    public let refreshTokenUseCase: RefreshTokenUseCase
    public let signInUseCase: SignInUseCase
    public let signUpUseCase: SignUpUseCase
    public let verificationEmailUseCase: VerificationEmailUseCase
    public let logoutUseCase: LogoutUseCase
}

public extension AuthServiceDependency {
    static func resolve() -> AuthServiceDependency {

        let repository: AuthRepository = AuthRepositoryImpl()

        let checkIdUseCase = CheckIdUseCase(
            repository: repository
        )
        let checkVerificationEmailUseCase = CheckVerificationEmailUseCase(
            repository: repository
        )
        let refreshTokenUseCase = RefreshTokenUseCase(
            repository: repository
        )
        let signInUseCase = SignInUseCase(
            repository: repository
        )
        let signUpUseCase = SignUpUseCase(
            repository: repository
        )
        let verificationEmailUseCase = VerificationEmailUseCase(
            repository: repository
        )
        let logoutUseCase = LogoutUseCase()

        return AuthServiceDependency(
            checkIdUseCase: checkIdUseCase,
            checkVerificationEmailUseCase: checkVerificationEmailUseCase,
            refreshTokenUseCase: refreshTokenUseCase,
            signInUseCase: signInUseCase,
            signUpUseCase: signUpUseCase,
            verificationEmailUseCase: verificationEmailUseCase,
            logoutUseCase: logoutUseCase
        )
    }
}
