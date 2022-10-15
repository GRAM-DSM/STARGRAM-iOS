import Foundation

import Combine

protocol FeedRepository {
    // swiftlint:disable line_length
    func createFeed(title: String, content: String, category: String, url: [String]) -> AnyPublisher<Void, STARGRAMError>
    func patchFeed(feedId: String, title: String, content: String) -> AnyPublisher<Void, STARGRAMError>
    func deleteFeed(feedId: String) -> AnyPublisher<Void, STARGRAMError>
    func uploadImage(images: [Data]) -> AnyPublisher<FeedImage, STARGRAMError>
    func fetchFeeds() -> AnyPublisher<[Feed], STARGRAMError>
    func fetchFeedDetails(feedId: String) -> AnyPublisher<FeedDetail, STARGRAMError>
    func createComment(feedId: String, content: String) -> AnyPublisher<Void, STARGRAMError>
    func patchComment(commentId: Int, feedId: String, content: String) -> AnyPublisher<Void, STARGRAMError>
    func deleteComment(commentId: Int) -> AnyPublisher<Void, STARGRAMError>
    func like(feedId: String) -> AnyPublisher<Void, STARGRAMError>
    func unLike(feedId: String) -> AnyPublisher<Void, STARGRAMError>
    func favorite(feedId: String) -> AnyPublisher<Void, STARGRAMError>
    func unFavorite(feedId: String) -> AnyPublisher<Void, STARGRAMError>
}
