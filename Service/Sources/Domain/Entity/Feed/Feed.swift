import Foundation

public struct Feed: Equatable {
    public let id: String
    public let name: String
    public let title: String
    public let created: Date
    public let heartCount: Int
    public let commentCount: Int
    public let imageUrl: URL
    public let heartStatus: Bool

    public init(
        id: String,
        name: String,
        title: String,
        created: Date,
        heartCount: Int,
        commentCount: Int,
        imageUrl: URL,
        heartStatus: Bool
    ) {
        self.id = id
        self.name = name
        self.title = title
        self.created = created
        self.heartCount = heartCount
        self.commentCount = commentCount
        self.imageUrl = imageUrl
        self.heartStatus = heartStatus
    }
}
