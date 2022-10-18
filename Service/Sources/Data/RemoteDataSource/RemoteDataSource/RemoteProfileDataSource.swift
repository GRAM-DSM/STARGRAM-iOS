import Foundation

import Moya
import Combine
import CombineMoya

final class RemoteProfileDataSource: MoyaProvider<ProfileAPI> {

    static let shared = RemoteProfileDataSource()

    private init() { }

    func writeProfile(_ request: ProfileRequest) -> AnyPublisher<Void, MoyaError> {
        return self.requestVoidPublisher(.writeProfile(request))
    }

    func patchProfile(_ request: ProfileRequest) -> AnyPublisher<Void, MoyaError> {
        return self.requestVoidPublisher(.patchProfile(request))
    }

    func deleteProfileImage() -> AnyPublisher<Void, MoyaError> {
        return self.requestVoidPublisher(.deleteProfileImage)
    }

    func fetchProfile() -> AnyPublisher<Profile, MoyaError> {
        return self.requestPublisher(.fetchProfile, ProfileResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    func fetchWritingFeeds() -> AnyPublisher<[Feed], MoyaError> {
        return self.requestPublisher(.fetchWritingFeeds, FeedListResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    func fetchFavoriteFeeds() -> AnyPublisher<[Feed], MoyaError> {
        return self.requestPublisher(.fetchFavoriteFeeds, FavoriteFeedListResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
