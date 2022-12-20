import Foundation

import Moya

protocol StarGramAPI: TargetType {
    var domain: ApiDomain { get }
    var urlPath: String { get }
}

extension StarGramAPI {

    var baseURL: URL {
        if domain == .feeds {
            return URL(string: "http://3.36.95.98:8080")!
        } else {
            return URL(string: "http://3.36.95.98:8000")!
        }
    }

    var path: String {
        return domain.url+urlPath
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
}

enum ApiDomain: String {
    case auths
    case feeds
    case profiles
    case searchs
}

extension ApiDomain {
    var url: String {
        return "\(self.rawValue)"
    }
}
