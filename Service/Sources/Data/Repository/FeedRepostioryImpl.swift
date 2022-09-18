import Foundation

import RxSwift
import Moya

class FeedRepositoryImpl: FeedRepository {

    private let remoteFeedDataSource = RemoteFeedDataSource.shared

    func createFeed(
        _ title: String,
        _ content: String,
        _ category: String,
        _ url: [String]
    ) -> Completable {
        return remoteFeedDataSource.createFeed(.init(
            title: title,
            content: content,
            category: category,
            url: url
        ))
    }

    func patchFeed(
        _ feedId: String,
        _ title: String,
        _ content: String) -> Completable {
            return remoteFeedDataSource.patchFeed(
                feedId,
                .init(
                    title: title,
                    content: content
                )
            )
    }

    func deleteFeed(_ feedId: String) -> Completable {
        return remoteFeedDataSource.deleteFeed(feedId)
    }

    func uploadImage(_ images: [Data]) -> Single<FeedImage> {
        return remoteFeedDataSource.uploadImage(images)
    }

    func fetchFeeds() -> Observable<[Feed]> {
        return remoteFeedDataSource.fetchFeeds()
            .asObservable()
    }

    func fetchFeedDetails(_ feedId: String) -> Single<FeedDetail> {
        return remoteFeedDataSource.fetchFeedDetail(feedId)
    }

    func createComment(_ feedId: String, _ content: String) -> Completable {
        return remoteFeedDataSource.createComment(.init(
            feedId: feedId,
            content: content
        ))
    }

    func patchComment(_ commentId: Int, _ feedId: String, _ content: String) -> Completable {
        return remoteFeedDataSource.patchComment(
            commentId,
            .init(
                feedId: feedId,
                content: content
            ))
    }

    func deleteComment(_ commentId: Int) -> Completable {
        return remoteFeedDataSource.deleteComment(commentId)
    }

    func like(_ feedId: String) -> Completable {
        return remoteFeedDataSource.like(feedId)
    }

    func unLike(_ feedId: String) -> Completable {
        return remoteFeedDataSource.unLike(feedId)
    }

    func favorite(_ feedId: String) -> Completable {
        return remoteFeedDataSource.favorite(feedId)
    }

    func unFavorite(_ feedId: String) -> Completable {
        return remoteFeedDataSource.unFavorite(feedId)
    }
}
