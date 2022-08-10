import Foundation

import Moya
import RxSwift
import RxMoya

final class RemoteProfileDataSource: MoyaProvider<ProfileAPI> {

    static let shared = RemoteProfileDataSource()

    private init() { }

    func writeProfile(_ request: ProfileRequest) -> Completable {
        return self.rx.request(.writeProfile(request))
            .asCompletable()
    }

    func patchProfile(_ request: ProfileRequest) -> Completable {
        return self.rx.request(.patchProfile(request))
            .asCompletable()
    }

    func deleteProfileImage() -> Completable {
        return self.rx.request(.deleteProfileImage)
            .asCompletable()
    }

    func fetchProfile() -> Single<Profile> {
        return self.rx.request(.fetchProfile)
            .map(ProfileResponse.self)
            .map { $0.toDomain() }
    }

    func fetchWritingFeeds() -> Single<[Feed]> {
        return self.rx.request(.fetchWritingFeeds)
            .map(FeedListResponse.self)
            .map { $0.toDomain() }
    }

    func fetchFavoriteFeeds() -> Single<[Feed]> {
        return self.rx.request(.fetchFavoriteFeeds)
            .map(FavoriteFeedListResponse.self)
            .map { $0.toDomain() }
    }
}
