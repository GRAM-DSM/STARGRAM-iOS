import Foundation

import Moya
import RxSwift
import RxMoya

final class RemoteAuthDataSource: MoyaProvider<AuthAPI> {

    static let shared = RemoteAuthDataSource()

    private init() { }

    func signin(_ request: SigninRequest) -> Single<TokenResponse> {
        return self.rx.request(.signin(request))
            .map(TokenResponse.self)
    }

    func signup(_ request: SignupRequest) -> Completable {
        return self.rx.request(.signup(request))
            .asCompletable()
    }

    func checkId(_ id: String) -> Completable {
        return self.rx.request(.checkId(id))
            .asCompletable()
    }

    func refreshToken(_ refreshToken: String) -> Single<TokenResponse> {
        return self.rx.request(.refreshToken(refreshToken))
            .map(TokenResponse.self)
    }

    func verificationEmail(_ email: String) -> Completable {
        return self.rx.request(.verificationEmail(email))
            .asCompletable()
    }

    func checkVerficationEmail(_ request: CheckVerificationEmailRequest) -> Completable {
        return rx.request(.checkVerificationEmail(request))
            .asCompletable()
    }
}
