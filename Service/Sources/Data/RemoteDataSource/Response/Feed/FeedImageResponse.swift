import Foundation

struct FeedImageResponse: Decodable {
    let url: String
}

extension FeedImageResponse {
    func toDomain() -> FeedImage {
        return .init(url: url)
    }
}
