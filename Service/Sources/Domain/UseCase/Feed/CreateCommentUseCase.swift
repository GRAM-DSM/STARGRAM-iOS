import Foundation

import RxSwift

public class CreateCommentUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(
        feedId: String,
        content: String
    ) -> Completable {
        return repository.createComment(feedId, content)
    }
}
