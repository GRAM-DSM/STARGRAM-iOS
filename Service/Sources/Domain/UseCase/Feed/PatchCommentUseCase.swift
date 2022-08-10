import Foundation

import RxSwift

public class PatchCommentUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(
        commentId: Int,
        feedId: String,
        content: String
    ) -> Completable {
        return repository.patchComment(commentId, feedId, content)
    }
}
