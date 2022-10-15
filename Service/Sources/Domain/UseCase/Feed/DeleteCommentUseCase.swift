import Foundation

import Combine

public class DeleteCommentUseCase {

    private let repsoitory: FeedRepository

    init(repository: FeedRepository) {
        self.repsoitory = repository
    }

    public func excute(commentId: Int) -> AnyPublisher<Void, STARGRAMError> {
        return repsoitory.deleteComment(commentId: commentId)
    }
}
