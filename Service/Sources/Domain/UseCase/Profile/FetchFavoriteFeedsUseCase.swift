import Foundation

import Combine

public class FetchFavoriteFeedsUseCase {

    private let repository: ProfileRepository

    init(repository: ProfileRepository) {
        self.repository = repository
    }

    public func excute() -> AnyPublisher<[Feed], STARGRAMError> {
        return repository.fetchFavoriteFeeds()
    }
}
