import Foundation

struct FeedDetailRepsponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "feed_uuid"
        case profileImageUrlString = "profile_image"
        case name
        case title
        case content
        case created = "create_at"
        case category
        case heartCount = "heart_count"
        case heartState = "heart_type"
        case commentCount = "comment_count"
        case favorite
        case images
        case comments
    }
    let id: String
    let profileImageUrlString: String
    let name: String
    let title: String
    let content: String
    let created: String
    let category: String
    let heartCount: Int
    let heartState: Bool
    let commentCount: Int
    let favorite: Bool
    let images: [String]
    let comments: [CommentResponse]
}

extension FeedDetailRepsponse {
    func toDomain() -> FeedDetail {
        return .init(
            id: id,
            profileImageUrl: profileImageUrlString,
            name: name,
            title: title,
            content: content,
            created: created.toDate(),
            category: category,
            heartCount: heartCount,
            heartState: heartState,
            commentCount: commentCount,
            favorite: favorite,
            images: images,
            comments: comments.map { $0.toDomain() }
        )
    }
}
