import Foundation

import Combine

public class CheckIdUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute(id: String) -> AnyPublisher<Void, STARGRAMError> {
        return repository.checkId(id: id)
    }
}
