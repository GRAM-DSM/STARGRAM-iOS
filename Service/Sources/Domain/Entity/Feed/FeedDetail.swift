import Foundation

public struct FeedDetail: Equatable {
    public let id: String
    public let profileImageUrl: String
    public let name: String
    public let title: String
    public var content: String
    public let created: Date
    public let category: String
    public var heartCount: Int
    public var heartState: Bool
    public let commentCount: Int
    public var favorite: Bool
    public let images: [String]
    public let comments: [Comment]

    public init(
        id: String,
        profileImageUrl: String,
        name: String,
        title: String,
        content: String,
        created: Date,
        category: String,
        heartCount: Int,
        heartState: Bool,
        commentCount: Int,
        favorite: Bool,
        images: [String],
        comments: [Comment]
    ) {
        self.id = id
        self.profileImageUrl = profileImageUrl
        self.name = name
        self.title = title
        self.content = content
        self.created = created
        self.category = category
        self.heartCount = heartCount
        self.heartState = heartState
        self.commentCount = commentCount
        self.favorite = favorite
        self.images = images
        self.comments = comments
    }
}
