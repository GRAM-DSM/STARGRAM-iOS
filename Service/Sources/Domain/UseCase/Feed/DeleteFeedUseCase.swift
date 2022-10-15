import Foundation

import Combine

public class DeleteFeedUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return repository.deleteFeed(feedId: feedId)
    }
}
