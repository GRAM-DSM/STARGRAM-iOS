import Foundation

import RxSwift

protocol FeedRepository {
    func createFeed(_ title: String, _ content: String, _ category: String, _ url: [String]) -> Completable
    func patchFeed(_ feedId: String, _ title: String, _ content: String) -> Completable
    func deleteFeed(_ feedId: String) -> Completable
    func uploadImage(_ images: [Data]) -> Single<[FeedImage]>
    func fetchFeeds() -> Observable<[Feed]>
    func fetchFeedDetails(_ feedId: String) -> Single<FeedDetail>
    func createComment(_ feedId: String, _ content: String) -> Completable
    func patchComment(_ commentId: Int, _ feedId: String, _ content: String) -> Completable
    func deleteComment(_ commentId: Int) -> Completable
    func like(_ feedId: String) -> Completable
    func unLike(_ feedId: String) -> Completable
    func favorite(_ feedId: String) -> Completable
    func unFavorite(_ feedId: String) -> Completable
}
