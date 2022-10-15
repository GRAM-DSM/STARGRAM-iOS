import Foundation

import Combine

protocol AuthRepository {
    func signin(id: String, password: String) -> AnyPublisher<Void, STARGRAMError>
    func signup(id: String, password: String, email: String) -> AnyPublisher<Void, STARGRAMError>
    func checkId(id: String) -> AnyPublisher<Void, STARGRAMError>
    func refreshToken() -> AnyPublisher<Void, STARGRAMError>
    func verificationEmail(email: String) -> AnyPublisher<Void, STARGRAMError>
    func checkVerificationEmail(email: String, code: String) -> AnyPublisher<Void, STARGRAMError>
}
