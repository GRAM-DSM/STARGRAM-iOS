import Foundation

struct CheckVerificationEmailRequest: Encodable {
    let email: String
    let code: String
}
