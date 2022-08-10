import Foundation

struct ProfileRequest: Encodable {
    let image: Data
    let name: String
    let introduce: String
    let link: String
}
