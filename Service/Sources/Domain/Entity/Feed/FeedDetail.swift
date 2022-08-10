import Foundation

public struct FeedDetail: Equatable {
    public let id: String
    public let profileImageUrl: URL
    public let name: String
    public let title: String
    public let content: String
    public let created: Date
    public let category: String
    public let heartCount: Int
    public let commentCount: Int
    public let favorite: Bool
    public let images: [Image]
    public let comments: [Comment]
}
