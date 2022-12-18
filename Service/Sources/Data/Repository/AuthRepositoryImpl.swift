import Foundation

import Moya
import Combine

class AuthRepositoryImpl: AuthRepository {

    private let keychainService = KeychainService.shared
    private let remoteAuthDataSource = RemoteAuthDataSource.shared

    func signin(
        id: String,
        password: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return remoteAuthDataSource.signin(.init(
            id: id,
            password: password
        )).map {
            self.keychainService.registerAccessToken($0.accessToken)
            self.keychainService.registerRefreshToken($0.refreshToken)
        }
        .mapError { _ in .badRequest }
        .eraseToAnyPublisher()
    }

    func signup(
        id: String,
        password: String,
        email: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return remoteAuthDataSource.signup(.init(
            id: id,
            password: password,
            email: email
        ))
        .mapError { _ in .badRequest }
        .eraseToAnyPublisher()
    }

    func checkId(id: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteAuthDataSource.checkId(id)
            .mapError { moyaError -> STARGRAMError in
                switch moyaError.response?.statusCode {
                case 409:
                    return STARGRAMError.conflict
                default:
                    print(moyaError.response?.statusCode ?? 0)
                    return .tooManyRequest
                }
            }
            .eraseToAnyPublisher()
    }

    func refreshToken() -> AnyPublisher<Void, STARGRAMError> {
        return remoteAuthDataSource.refreshToken()
            .map {
                self.keychainService.registerAccessToken($0.accessToken)
                self.keychainService.registerRefreshToken($0.refreshToken)
            }
            .mapError {
                print($0.response?.statusCode ?? 0)
                return .badRequest
            }
            .eraseToAnyPublisher()
    }

    func verificationEmail(email: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteAuthDataSource.verificationEmail(email)
            .mapError { _ in .badRequest }
            .eraseToAnyPublisher()
    }

    func checkVerificationEmail(
        email: String,
        code: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return remoteAuthDataSource.checkVerficationEmail(.init(
            email: email,
            code: code
        ))
        .mapError { moyaError -> STARGRAMError in
            switch moyaError.response?.statusCode {
            case 422:
                return .emailOutTheStyle
            default:
                return .badRequest
            }
        }
        .eraseToAnyPublisher()
    }
}
