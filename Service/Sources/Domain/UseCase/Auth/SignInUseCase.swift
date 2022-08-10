import Foundation

import RxSwift

public class SignInUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(
        id: String,
        password: String
    ) -> Completable {
        return repository.signin(id, password)
    }
}
