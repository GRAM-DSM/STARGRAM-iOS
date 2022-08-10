import Foundation

import RxSwift

public class SignUpUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(
        id: String,
        password: String,
        email: String
    ) -> Completable {
        return repository.signup(id, password, email)
    }
}
