import Foundation

import RxSwift
import Moya

class AuthRepositoryImpl: AuthRepository {

    private let keychainService = KeychainService.shared
    private let remoteAuthDataSource = RemoteAuthDataSource.shared

    func signin(_ id: String, _ password: String) -> Completable {
        return remoteAuthDataSource.signin(.init(
            id: id,
            password: password
        )).map {
            self.keychainService.registerAccessToken($0.accessToken)
            self.keychainService.registerRefreshToken($0.refreshToken)
        }.asCompletable()
    }

    func signup(_ id: String, _ password: String, _ email: String) -> Completable {
        return remoteAuthDataSource.signup(.init(
            id: id,
            password: password,
            email: email
        ))
    }

    func checkId(_ id: String) -> Completable {
        return remoteAuthDataSource.checkId(id)
    }

    func refreshToken() -> Completable {
        let refreshToken = keychainService.fetchRefreshToken() ?? ""
        return remoteAuthDataSource.refreshToken(refreshToken)
            .map {
                self.keychainService.registerAccessToken($0.accessToken)
                self.keychainService.registerRefreshToken($0.refreshToken)
            }.asCompletable()
    }

    func verificationEmail(_ email: String) -> Completable {
        return remoteAuthDataSource.verificationEmail(email)
    }

    func checkVerificationEmail(_ email: String, _ code: String) -> Completable {
        return remoteAuthDataSource.checkVerficationEmail(.init(
            email: email,
            code: code
        ))
    }

}
