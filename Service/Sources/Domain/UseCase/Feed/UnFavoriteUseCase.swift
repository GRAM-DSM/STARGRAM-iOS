import Foundation

import RxSwift

public class UnFavoriteUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(feedId: String) -> Completable {
        return repository.unFavorite(feedId)
    }
}
