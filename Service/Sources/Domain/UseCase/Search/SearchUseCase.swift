import Foundation

import Combine

public class SearchUseCase {

    private let repository: SearchRepository

    init(repository: SearchRepository) {
        self.repository = repository
    }

    public func excute(keyword: String) -> AnyPublisher<[Search], STARGRAMError> {
        return repository.search(keyword: keyword)
    }
}
