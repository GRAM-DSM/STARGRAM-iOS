import Foundation

struct SearchResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case feedId = "feed_uuid"
        case title
    }
    let feedId: String
    let title: String
}

extension SearchResponse {
    func toDomain() -> Search {
        return .init(
            feedId: feedId,
            title: title
        )
    }
}
