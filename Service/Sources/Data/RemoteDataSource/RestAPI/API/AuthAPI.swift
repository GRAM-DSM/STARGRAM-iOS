import Foundation

enum AuthAPI {
    case signup(_ id: String, _ password: String)
    case signin(_ id: String, _ password: String)
    case refreshToken(_ token: String)
    case checkExistId(_ id: String)
    case verificationEmail(_ email: String)
    case checkVerificationEmail(_ code: String, _ email: String)
}

extension AuthAPI: StarGramAPI {
    var domain: ApiDomain {
        return .users
    }

    var urlPath: String {
        switch self {
        }
    }
    
    var method: Method {
        <#code#>
    }
    
    var jwtTokenType: JWTTokenType {
        <#code#>
    }
    
    
}
