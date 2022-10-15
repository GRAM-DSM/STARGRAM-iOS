import Foundation

import RxSwift
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
    }

    func checkId(id: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteAuthDataSource.checkId(id)
    }

    func refreshToken() -> AnyPublisher<Void, STARGRAMError> {
        let refreshToken = keychainService.fetchRefreshToken() ?? ""
        return remoteAuthDataSource.refreshToken(refreshToken)
            .map {
                self.keychainService.registerAccessToken($0.accessToken)
                self.keychainService.registerRefreshToken($0.refreshToken)
            }
            .eraseToAnyPublisher()
    }

    func verificationEmail(email: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteAuthDataSource.verificationEmail(email)
    }

    func checkVerificationEmail(
        email: String,
        code: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return remoteAuthDataSource.checkVerficationEmail(.init(
            email: email,
            code: code
        ))
    }

}
