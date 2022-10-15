import Foundation

import Combine
import Moya

class FeedRepositoryImpl: FeedRepository {

    private let remoteFeedDataSource = RemoteFeedDataSource.shared

    func createFeed(
        title: String,
        content: String,
        category: String,
        url: [String]
    ) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.createFeed(.init(
            title: title,
            content: content,
            category: category,
            url: url
        ))
    }

    func patchFeed(
        feedId: String,
        title: String,
        content: String
    ) -> AnyPublisher<Void, STARGRAMError> {
            return remoteFeedDataSource.patchFeed(
                feedId,
                .init(
                    title: title,
                    content: content
                )
            )
    }

    func deleteFeed(feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.deleteFeed(feedId)
    }

    func uploadImage(images: [Data]) -> AnyPublisher<FeedImage, STARGRAMError> {
        return remoteFeedDataSource.uploadImage(images)
    }

    func fetchFeeds() -> AnyPublisher<[Feed], STARGRAMError> {
        return remoteFeedDataSource.fetchFeeds()
    }

    func fetchFeedDetails(feedId: String) -> AnyPublisher<FeedDetail, STARGRAMError> {
        return remoteFeedDataSource.fetchFeedDetail(feedId)
    }

    func createComment(feedId: String, content: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.createComment(.init(
            feedId: feedId,
            content: content
        ))
    }

    func patchComment(
        commentId: Int,
        feedId: String,
        content: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.patchComment(
            commentId,
            .init(
                feedId: feedId,
                content: content
            ))
    }

    func deleteComment(commentId: Int) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.deleteComment(commentId)
    }

    func like(feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.like(feedId)
    }

    func unLike(feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.unLike(feedId)
    }

    func favorite(feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.favorite(feedId)
    }

    func unFavorite(feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.unFavorite(feedId)
    }
}
