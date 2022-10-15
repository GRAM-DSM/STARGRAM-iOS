import Foundation

import Combine

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
    ) -> AnyPublisher<Void, STARGRAMError> {
        return repository.createFeed(
            title: title,
            content: content,
            category: category,
            url: url
        )
    }
}
