import Foundation

import Combine

public class CreateCommentUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(
        feedId: String,
        content: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return repository.createComment(feedId: feedId, content: content)
    }
}
