import Foundation

import RxSwift

public class FetchFeedsUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<[Feed]> {
        return repository.fetchFeeds()
    }
}
