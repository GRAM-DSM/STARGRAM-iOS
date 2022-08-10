import Foundation

import RxSwift

public class DeleteCommentUseCase {

    private let repsoitory: FeedRepository

    init(repository: FeedRepository) {
        self.repsoitory = repository
    }

    public func excute(commentId: Int) -> Completable {
        return repsoitory.deleteComment(commentId)
    }
}
