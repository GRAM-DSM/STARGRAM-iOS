import Foundation

struct ProfileResponse: Decodable {
    let name: String
    let introduce: String
    let link: String
    let image: String
}

extension ProfileResponse {
    func toDomain() -> Profile {
        return .init(
            name: name,
            introduce: introduce,
            link: URL(string: link)!,
            image: URL(string: image)!
        )
    }
}
