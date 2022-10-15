import Foundation

import Moya
import Combine
import CombineMoya

final class RemoteAuthDataSource: MoyaProvider<AuthAPI> {

    static let shared = RemoteAuthDataSource()

    private init() { }

    func signin(_ request: SigninRequest) -> AnyPublisher<TokenResponse, STARGRAMError> {
        return self.requestPublisher(.signin(request), TokenResponse.self)
    }

    func signup(_ request: SignupRequest) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.signup(request))
    }

    func checkId(_ id: String) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.checkId(id))
    }

    func refreshToken(_ refreshToken: String) -> AnyPublisher<TokenResponse, STARGRAMError> {
        return self.requestPublisher(.refreshToken(refreshToken), TokenResponse.self)
    }

    func verificationEmail(_ email: String) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.verificationEmail(email))
    }

    func checkVerficationEmail(
        _ request: CheckVerificationEmailRequest
    ) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.checkVerificationEmail(request))
    }
}
