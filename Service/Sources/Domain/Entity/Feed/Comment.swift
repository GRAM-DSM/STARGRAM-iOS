import Foundation

public struct Comment: Equatable {
    public let commentId: Int
    public let profileImageUrl: URL
    public let name: String
    public let content: String
    public let created: Date

    public init(
        commentId: Int,
        profileImageUrl: URL,
        name: String,
        content: String,
        created: Date
    ) {
        self.commentId = commentId
        self.profileImageUrl = profileImageUrl
        self.name = name
        self.content = content
        self.created = created
    }
}
