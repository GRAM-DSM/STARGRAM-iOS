import Foundation

import Combine

public class VerificationEmailUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(email: String) -> AnyPublisher<Void, STARGRAMError> {
        return repository.verificationEmail(email: email)
    }
}
