import Foundation

struct CreateFeedRequest: Encodable {
    let title: String
    let content: String
    let category: String
    let url: String
}
