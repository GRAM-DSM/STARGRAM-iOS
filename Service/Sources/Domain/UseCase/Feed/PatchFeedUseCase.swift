import Foundation

import RxSwift

public class PatchFeedUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(
        feedId: String,
        title: String,
        content: String
    ) -> Completable {
        return repository.patchFeed(feedId, title, content)
    }
}
