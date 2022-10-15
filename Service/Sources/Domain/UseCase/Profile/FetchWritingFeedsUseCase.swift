import Foundation

import Combine

public class FetchWritingFeedsUseCase {

    private let repository: ProfileRepository

    init(repository: ProfileRepository) {
        self.repository = repository
    }

    public func excute() -> AnyPublisher<[Feed], STARGRAMError> {
        return repository.fetchWritingFeeds()
    }
}
