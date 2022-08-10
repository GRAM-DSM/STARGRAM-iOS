import Foundation

struct FeedListResponse: Decodable {
    let feeds: [FeedResponse]
}

extension FeedListResponse {
    func toDomain() -> [Feed] {
        return feeds.map { $0.toDomain() }
    }
}
