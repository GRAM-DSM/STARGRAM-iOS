import Foundation

import RxSwift

protocol AuthRepository {
    func signin(_ id: String, _ password: String) -> Completable
    func signup(_ id: String, _ password: String, _ email: String) -> Completable
    func checkId(_ id: String) -> Completable
    func refreshToken() -> Completable
    func verificationEmail(_ email: String) -> Completable
    func checkVerificationEmail(_ email: String, _ code: String) -> Completable
}
