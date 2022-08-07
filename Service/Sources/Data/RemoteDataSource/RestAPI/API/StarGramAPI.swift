import Foundation

import Moya

protocol StarGramAPI: TargetType, JWTTokenAuthorizable{
    var domain: ApiDomain { get }
    var urlPath: String { get }
}

extension StarGramAPI {

    var baseURL: URL { URL(string: "")! }

    var path: String {
        return domain.uri+urlPath
    }

    var task: Task { .requestPlain }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
}

enum ApiDomain: String {
    case users
    case profiles
    case feeds
}

extension ApiDomain {
    var uri: String {
        return "\(self.rawValue)"
    }
}
