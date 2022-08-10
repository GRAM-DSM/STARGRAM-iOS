import Foundation


struct SignupRequest: Encodable {
    private enum CodingKeys: String, CodingKey {
        case id = "account_id"
        case password
        case email
    }
    let id: String
    let password: String
    let email: String
}
