import Foundation

struct FeedImageListResponse: Decodable {
    let images: [FeedImageResponse]
}

extension FeedImageListResponse {
    func toDomain() -> [FeedImage] {
        return images.map { $0.toDomain() }
    }
}
