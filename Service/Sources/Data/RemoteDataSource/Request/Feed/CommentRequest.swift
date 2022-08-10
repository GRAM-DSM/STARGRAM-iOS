import Foundation

struct CommentRequest: Encodable {
    private enum CodingKeys: String, CodingKey {
        case feedId = "feed_uuid"
        case content
    }
    let feedId: String
    let content: String
}
