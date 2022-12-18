import Foundation

import Moya
import Combine
import CombineMoya

final class RemoteSearchDataSource: MoyaProvider<SearchAPI> {

    static let shared = RemoteSearchDataSource()

    private init() { }

    func search(keyword: String) -> AnyPublisher<[Search], MoyaError> {
        return self.requestPublisher(.search(keyword), SearchListResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

}
