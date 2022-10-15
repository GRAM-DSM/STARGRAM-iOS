import Foundation

import Combine

public class FetchProfileUseCase {

    private let repository: ProfileRepository

    init(repository: ProfileRepository) {
        self.repository = repository
    }

    public func excute() -> AnyPublisher<Profile, STARGRAMError> {
        return repository.fetchProfile()
    }
}
