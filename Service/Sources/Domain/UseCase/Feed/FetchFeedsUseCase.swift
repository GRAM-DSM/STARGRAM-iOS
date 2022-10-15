import Foundation

import Combine

public class FetchFeedsUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute() -> AnyPublisher<[Feed], STARGRAMError> {
        return repository.fetchFeeds()
    }
}
