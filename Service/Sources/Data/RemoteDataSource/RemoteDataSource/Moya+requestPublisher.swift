import Foundation

import Moya
import Combine
import CombineMoya

extension MoyaProvider {
    func requestPublisher<T: Decodable>(
        _ target: Target,
        _ model: T.Type
    ) -> AnyPublisher<T, STARGRAMError> {
        return self.requestPublisher(target)
            .map(model.self)
            .mapError { STARGRAMError($0) }
            .eraseToAnyPublisher()
    }

    func requestVoidPublisher(_ target: Target) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestPublisher(target)
            .map { _ in return }
            .mapError { STARGRAMError($0) }
            .eraseToAnyPublisher()
    }
}
