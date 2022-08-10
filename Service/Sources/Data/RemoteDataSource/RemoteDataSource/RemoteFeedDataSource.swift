import Foundation

import Moya
import RxSwift
import RxMoya

final class RemoteFeedDataSource: MoyaProvider<FeedAPI> {

    static let shared = RemoteFeedDataSource()

    private init() { }

    func createFeed(_ request: CreateFeedRequest) -> Completable {
        return self.rx.request(.createFeed(request))
            .asCompletable()
    }

    func patchFeed(_ feedId: String, _ request: PatchFeedRequest) -> Completable {
        return self.rx.request(.patchFeed(feedId, request))
            .asCompletable()
    }

    func deleteFeed(_ feedId: String) -> Completable {
        return self.rx.request(.deleteFeed(feedId))
            .asCompletable()
    }

    func uploadImage(_ images: [Data]) -> Single<[FeedImage]> {
        return self.rx.request(.uploadImage(images))
            .map(FeedImageListResponse.self)
            .map { $0.toDomain() }
    }

    func fetchFeeds() -> Single<[Feed]> {
        return self.rx.request(.fetchFeeds)
            .map(FeedListResponse.self)
            .map { $0.toDomain() }
    }

    func fetchFeedDetail(_ feedId: String) -> Single<FeedDetail> {
        return self.rx.request(.fetchFeedDetail(feedId))
            .map(FeedDetailRepsponse.self)
            .map { $0.toDomain() }
    }

    func createComment(_ request: CommentRequest) -> Completable {
        return self.rx.request(.createComment(request))
            .asCompletable()
    }

    func patchComment(
        _ commentId: Int,
        _ request: CommentRequest
    ) -> Completable {
        return self.rx.request(.patchComment(commentId, request))
            .asCompletable()
    }

    func deleteComment(_ commentId: Int) -> Completable {
        return self.rx.request(.deleteComment(commentId))
            .asCompletable()
    }

    func like(_ feedId: String) -> Completable {
        return self.rx.request(.like(feedId))
            .asCompletable()
    }

    func unLike(_ feedId: String) -> Completable {
        return self.rx.request(.unLike(feedId))
            .asCompletable()
    }

    func favorite(_ feedId: String) -> Completable {
        return self.rx.request(.favorite(feedId))
            .asCompletable()
    }

    func unFavorite(_ feedId: String) -> Completable {
        return self.rx.request(.unFavorite(feedId))
            .asCompletable()
    }
}
