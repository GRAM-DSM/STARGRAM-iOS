import Foundation

import Moya
import RxSwift

protocol JWTTokenAuthorizable {
    var jwtTokenType: JWTTokenType { get }
}

enum JWTTokenType {
    case none

    case accessToken
    case refreshToken

    public var headerString: String? {
        switch self {
        case .accessToken:
            return "Authorization"
        case .refreshToken:
            return "Refresh-Token"
        default:
            return nil
        }
    }
}

final class JWTPlugin: PluginType {

    private let keychainDataSource = KeychainDataSource.shared

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let authorizable = target as? JWTTokenAuthorizable,
              let token = getToken(type: authorizable.jwtTokenType),
              authorizable.jwtTokenType != .none
        else { return request }

        var request = request

        let authValue = "Bearer \(token)"
        request.addValue(authValue, forHTTPHeaderField: authorizable.jwtTokenType.headerString!)
        return request
    }
}

extension JWTPlugin {

    private func getToken(type: JWTTokenType) -> String? {
        switch type {
        case .none:
            return nil
        case .accessToken:
            return fetchAccessToken()
        case .refreshToken:
            return fetchRefreshToken()
        }
    }

    private func fetchAccessToken() -> String? {
        self.keychainDataSource.fetchToken(tokenType: .accessToken)
    }

    private func fetchRefreshToken() -> String? {
        self.keychainDataSource.fetchToken(tokenType: .refreshToken)
    }
}
