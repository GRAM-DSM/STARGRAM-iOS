import Foundation

struct SearchListResponse: Decodable {
    let feeds: [SearchResponse]
}

extension SearchListResponse {
    func toDomain() -> [Search] {
        return feeds.map { $0.toDomain() }
    }
}
