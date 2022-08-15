import Foundation

struct ImageResponse: Decodable {
    let older: Int
    let image: String
}

extension ImageResponse {
    func toDomain() -> Image {
        return .init(
            older: older,
            imageUrl: URL(string: image)!
        )
    }
}
