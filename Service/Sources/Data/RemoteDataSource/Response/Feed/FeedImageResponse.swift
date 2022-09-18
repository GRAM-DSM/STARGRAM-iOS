import Foundation

struct FeedImageResponse: Decodable {
    let urls: [String]
}

extension FeedImageResponse {
    func toDomain() -> FeedImage {
        return .init(urls: urls)
    }
}
