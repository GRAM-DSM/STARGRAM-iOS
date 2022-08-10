import Foundation

import RxSwift

public class CheckIdUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(id: String) -> Completable {
        return repository.checkId(id)
    }
}
