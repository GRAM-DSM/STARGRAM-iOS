import Foundation

import Moya

enum AuthAPI {
    case signup(_ request: SignupRequest)
    case signin(_ request: SigninRequest)
    case checkId(_ id: String)
    case refreshToken(_ refreshToken: String)
    case verificationEmail(_ email: String)
    case checkVerificationEmail(_ request: CheckVerificationEmailRequest)
}

extension AuthAPI: StarGramAPI {

    var domain: ApiDomain {
        return .auths
    }

    var urlPath: String {
        switch self {
        case .signin:
            return "/login"
        case .verificationEmail:
            return "/email"
        case .checkVerificationEmail:
            return "/email/check"
        case .checkId:
            return "/id/check"
        default:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .refreshToken:
            return .put
        default:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .signin(let request):
            return .requestJSONEncodable(request)
        case .signup(let request):
            return .requestJSONEncodable(request)
        case .checkVerificationEmail(let request):
            return .requestJSONEncodable(request)
        case .verificationEmail(let email):
            return .requestParameters(
                parameters: [
                    "email": email
                ],
                encoding: JSONEncoding.default
            )
        case .checkId(let id):
            return .requestParameters(
                parameters: [
                    "account_id": id
                ],
                encoding: JSONEncoding.default
            )
        default:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        switch self {
        case .refreshToken(let refreshToken):
            return ["Authorization": "Bearer \(refreshToken)"]
        default:
            return nil
        }
    }
}
