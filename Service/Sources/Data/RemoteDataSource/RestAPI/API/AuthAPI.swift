import Foundation

import Moya

enum AuthAPI {
    case signup(_ id: String, _ password: String, _ email: String)
    case signin(_ id: String, _ password: String)
    case refreshToken(_ token: String)
    case checkExistId(_ id: String)
    case verificationEmail(_ email: String)
    case checkVerificationEmail(_ email: String, _ code: String)
}

extension AuthAPI: StarGramAPI {
    var domain: ApiDomain {
        return .auths
    }

    var urlPath: String {
        switch self {
        case .signin:
            return "/login"
        case .verificationEmail, .checkVerificationEmail:
            return "/email"
        default :
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .refreshToken:
            return .put
        case .checkExistId, .verificationEmail:
            return .get
        default:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .signup(let id, let password, let email):
            return .requestParameters(
                parameters: [
                    "account_id": id,
                    "password": password,
                    "email": email
                ],
                encoding: JSONEncoding.default
            )
        case .checkExistId(let id):
            return .requestParameters(
                parameters: [
                    "account_id": id
                ],
                encoding: JSONEncoding.default
            )
        case .signin(let id, let password):
            return .requestParameters(
                parameters: [
                    "account_id": id,
                    "password": password
                ],
                encoding: JSONEncoding.default
            )
        case .verificationEmail(let email):
            return .requestParameters(
                parameters: [
                    "email": email
                ],
                encoding: JSONEncoding.default
            )
        case .checkVerificationEmail(let email, let code):
            return .requestParameters(
                parameters: [
                    "email": email,
                    "code": code
                ],
                encoding: JSONEncoding.default
            )
        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JWTTokenType {
        switch self {
        case .refreshToken:
            return .refreshToken
        default:
            return .none
        }
    }
}
