import Foundation

import Combine

public class PatchCommentUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(
        commentId: Int,
        feedId: String,
        content: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return repository.patchComment(
            commentId: commentId,
            feedId: feedId,
            content: content
        )
    }
}
