import Foundation

import Combine

public class RefreshTokenUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    public func excute() -> AnyPublisher<Void, STARGRAMError> {
        return repository.refreshToken()
    }
}
