import Foundation

struct FavoriteFeedListResponse: Decodable {
    let favorites: [FeedResponse]
}

extension FavoriteFeedListResponse {
    func toDomain() -> [Feed] {
        return favorites.map { $0.toDomain() }
    }
}
