import Foundation

import Combine

public class SignInUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(
        id: String,
        password: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return repository.signin(id: id, password: password)
    }
}
