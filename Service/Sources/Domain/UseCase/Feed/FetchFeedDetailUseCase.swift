import Foundation

import Combine

public class FetchFeedDetailUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(feedId: String) -> AnyPublisher<FeedDetail, STARGRAMError> {
        return repository.fetchFeedDetails(feedId: feedId)
    }
}
