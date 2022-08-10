import Foundation

import RxSwift

public class CreateFeedUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(
        title: String,
        content: String,
        category: String,
        url: [String]
    ) -> Completable {
        return repository.createFeed(title, content, category, url)
    }
}
