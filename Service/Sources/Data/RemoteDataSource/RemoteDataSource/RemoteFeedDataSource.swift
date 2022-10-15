import Foundation

import Moya
import Combine
import CombineMoya

final class RemoteFeedDataSource: MoyaProvider<FeedAPI> {

    static let shared = RemoteFeedDataSource()

    private init() { }

    func createFeed(_ request: CreateFeedRequest) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.createFeed(request))
    }

    func patchFeed(
        _ feedId: String,
        _ request: PatchFeedRequest
    ) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.patchFeed(feedId, request))
    }

    func deleteFeed(_ feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.deleteFeed(feedId))
    }

    func uploadImage(_ images: [Data]) -> AnyPublisher<FeedImage, STARGRAMError> {
        return self.requestPublisher(.uploadImage(images), FeedImageResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    func fetchFeeds() -> AnyPublisher<[Feed], STARGRAMError> {
        return self.requestPublisher(.fetchFeeds, FeedListResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    func fetchFeedDetail(_ feedId: String) -> AnyPublisher<FeedDetail, STARGRAMError> {
        return self.requestPublisher(.fetchFeedDetail(feedId), FeedDetailRepsponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    func createComment(_ request: CommentRequest) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.createComment(request))
    }

    func patchComment(
        _ commentId: Int,
        _ request: CommentRequest
    ) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.patchComment(commentId, request))
    }

    func deleteComment(_ commentId: Int) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.deleteComment(commentId))
    }

    func like(_ feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.like(feedId))
    }

    func unLike(_ feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.unLike(feedId))
    }

    func favorite(_ feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.favorite(feedId))
    }

    func unFavorite(_ feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.unFavorite(feedId))
    }
}
