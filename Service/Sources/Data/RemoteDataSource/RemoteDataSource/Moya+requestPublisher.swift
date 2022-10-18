import Foundation

import Moya
import Combine
import CombineMoya

extension MoyaProvider {
    func requestPublisher<T: Decodable>(
        _ target: Target,
        _ model: T.Type
    ) -> AnyPublisher<T, MoyaError> {
        return self.requestPublisher(target)
            .filterSuccessfulStatusCodes()
            .map(model.self)
            .eraseToAnyPublisher()
    }

    func requestVoidPublisher(_ target: Target) -> AnyPublisher<Void, MoyaError> {
        return self.requestPublisher(target)
            .filterSuccessfulStatusCodes()
            .map { _ in return }
            .eraseToAnyPublisher()
    }
}
