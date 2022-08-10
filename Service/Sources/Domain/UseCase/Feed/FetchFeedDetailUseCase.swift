import Foundation

import RxSwift

public class FetchFeedDetailUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(feedId: String) -> Single<FeedDetail> {
        return repository.fetchFeedDetails(feedId)
    }
}
