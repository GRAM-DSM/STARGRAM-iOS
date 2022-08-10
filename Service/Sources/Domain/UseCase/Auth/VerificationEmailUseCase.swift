import Foundation

import RxSwift

public class VerificationEmailUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(email: String) -> Completable {
        return repository.verificationEmail(email)
    }
}
