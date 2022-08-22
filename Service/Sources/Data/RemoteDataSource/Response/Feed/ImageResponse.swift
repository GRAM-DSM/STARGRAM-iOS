import Foundation

struct ImageResponse: Decodable {
    let older: Int
    let image: String
}

extension ImageResponse {
    func toDomain() -> DetailImage {
        return .init(
            older: older,
            imageUrl: image
        )
    }
}
