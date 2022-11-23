import Foundation

struct SearchResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case feedId = "feed_uuid"
        case title
        case createAt = "create_at"
        case heartCount = "heart_count"
        case commentCount = "comment_count"
        case image
    }
    let feedId: String
    let title: String
    let createAt: String
    let heartCount: Int
    let commentCount: Int
    let image: String
}

extension SearchResponse {
    func toDomain() -> Search {
        return .init(
            feedId: feedId,
            title: title,
            createAt: createAt.toDate(),
            heartCount: heartCount,
            commentCount: commentCount,
            image: image
        )
    }
}
