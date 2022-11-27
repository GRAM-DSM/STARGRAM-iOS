import Foundation

import Combine

protocol SearchRepository {
    func search(keyword: String) -> AnyPublisher<[Search], STARGRAMError>
}
