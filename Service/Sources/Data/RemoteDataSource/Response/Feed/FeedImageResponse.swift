import Foundation

struct FeedImageResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
    }
    let imageUrl: [String]
}

extension FeedImageResponse {
    func toDomain() -> FeedImage {
        return .init(urls: imageUrl)
    }
}
