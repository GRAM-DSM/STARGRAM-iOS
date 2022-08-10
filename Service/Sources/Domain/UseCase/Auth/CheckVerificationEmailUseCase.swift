import Foundation

import RxSwift

public class CheckVerificationEmailUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(
        email: String,
        code: String
    ) -> Completable {
        return repository.checkVerificationEmail(email, code)
    }
}
