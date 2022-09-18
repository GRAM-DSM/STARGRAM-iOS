import Foundation

public struct FeedDetail: Equatable {
    public let id: String
    public let profileImageUrl: String
    public let name: String
    public let title: String
    public var content: String
    public let created: Date
    public let category: String
    public let heartCount: Int
    public let commentCount: Int
    public let favorite: Bool
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
        self.commentCount = commentCount
        self.favorite = favorite
        self.images = images
        self.comments = comments
    }
}
