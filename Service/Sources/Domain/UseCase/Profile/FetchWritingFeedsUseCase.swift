import Foundation

import RxSwift

public class FetchWritingFeedsUseCase {

    private let repository: ProfileRepository

    init(repository: ProfileRepository) {
        self.repository = repository
    }

    public func excute() -> Observable<[Feed]> {
        return repository.fetchWritingFeeds()
    }
}
