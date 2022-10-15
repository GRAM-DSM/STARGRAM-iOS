import Foundation

import Combine

public class FavoriteUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return repository.favorite(feedId: feedId)
    }
}
