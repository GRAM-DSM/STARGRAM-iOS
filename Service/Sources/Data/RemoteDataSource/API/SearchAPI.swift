import Foundation

import Moya

enum SearchAPI {
    case search(_ keyword: String)
}

extension SearchAPI: StarGramAPI {

    var domain: ApiDomain {
        return .searchs
    }

    var urlPath: String {
        switch self {
        case .search(let keyword):
            return "/\(keyword)"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var headers: [String: String]? {
        let token = KeychainService.shared.fetchAccessToken() ?? ""
        return ["Authorization": "Bearer \(token)"]
    }
}
