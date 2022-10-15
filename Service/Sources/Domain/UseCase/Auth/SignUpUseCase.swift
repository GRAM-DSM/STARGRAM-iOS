import Foundation

import Combine

public class SignUpUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(
        id: String,
        password: String,
        email: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return repository.signup(id: id, password: password, email: email)
    }
}
