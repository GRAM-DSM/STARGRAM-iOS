import Foundation

struct FeedResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "feed_uuid"
        case name
        case title
        case created = "create_at"
        case heartCount = "heart_count"
        case commentCount = "comment_count"
        case imageUrlString = "image"
        case heartStatus = "heart_status"
    }
    let id: String
    let name: String
    let title: String
    let created: String
    let heartCount: Int
    let commentCount: Int
    let imageUrlString: String
    let heartStatus: Bool
}

extension FeedResponse {
    func toDomain() -> Feed {
        return .init(
            id: id,
            name: name,
            title: title,
            created: created.toDate(),
            heartCount: heartCount,
            commentCount: commentCount,
            imageUrl: URL(string: imageUrlString)!,
            heartStatus: heartStatus
        )
    }
}
