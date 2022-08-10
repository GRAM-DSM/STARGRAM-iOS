import Foundation

struct CommentResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case commentId = "comment_id"
        case profileImageUrlString = "profile_image"
        case name
        case content
        case created = "create_at"
    }
    let commentId: Int
    let profileImageUrlString: String
    let name: String
    let content: String
    let created: String
}

extension CommentResponse {
    func toDomain() -> Comment {
        return .init(
            commentId: commentId,
            profileImageUrl: URL(string: profileImageUrlString)!,
            name: name,
            content: content,
            created: created.toDate()
        )
    }
}
