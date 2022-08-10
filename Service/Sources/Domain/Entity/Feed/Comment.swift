import Foundation

public struct Comment: Equatable {
    public let commentId: Int
    public let profileImageUrl: URL
    public let name: String
    public let content: String
    public let created: Date
}
