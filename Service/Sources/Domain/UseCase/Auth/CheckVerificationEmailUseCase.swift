import Foundation

import Combine

public class CheckVerificationEmailUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(
        email: String,
        code: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return repository.checkVerificationEmail(email: email, code: code)
    }
}
