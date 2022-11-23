import Foundation

import Combine
import Moya

class SearchRepositoryImpl: SearchRepository {

    private let remoteDataSource = RemoteSearchDataSource.shared

    func search(keyword: String) -> AnyPublisher<[Search], STARGRAMError> {
        return remoteDataSource.search(keyword: keyword)
            .mapError { error -> STARGRAMError in
                print(error.response?.statusCode ?? 0)
                switch error.response?.statusCode {
                case 400:
                    return .unauthorization
                case 429:
                    return .tooManyRequest
                default:
                    return .badRequest
                }
            }
            .eraseToAnyPublisher()
    }

}
