import Foundation

import Combine

public class PatchFeedUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(
        feedId: String,
        title: String,
        content: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return repository.patchFeed(
            feedId: feedId,
            title: title,
            content: content
        )
    }
}
