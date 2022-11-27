import Foundation

struct FeedListResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case feeds = "feed_response_list"
    }
    let feeds: [FeedResponse]
}

extension FeedListResponse {
    func toDomain() -> [Feed] {
        return feeds.map { $0.toDomain() }
    }
}
