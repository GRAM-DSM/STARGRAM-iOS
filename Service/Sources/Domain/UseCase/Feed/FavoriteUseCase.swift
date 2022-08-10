import Foundation

import RxSwift

public class FavoriteUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(feedId: String) -> Completable {
        return repository.favorite(feedId)
    }
}
