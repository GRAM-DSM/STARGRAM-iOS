import Foundation

import Moya
import Combine
import CombineMoya

final class RemoteProfileDataSource: MoyaProvider<ProfileAPI> {

    static let shared = RemoteProfileDataSource()

    private init() { }

    func writeProfile(_ request: ProfileRequest) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.writeProfile(request))
    }

    func patchProfile(_ request: ProfileRequest) -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.patchProfile(request))
    }

    func deleteProfileImage() -> AnyPublisher<Void, STARGRAMError> {
        return self.requestVoidPublisher(.deleteProfileImage)
    }

    func fetchProfile() -> AnyPublisher<Profile, STARGRAMError> {
        return self.requestPublisher(.fetchProfile, ProfileResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    func fetchWritingFeeds() -> AnyPublisher<[Feed], STARGRAMError> {
        return self.requestPublisher(.fetchWritingFeeds, FeedListResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    func fetchFavoriteFeeds() -> AnyPublisher<[Feed], STARGRAMError> {
        return self.requestPublisher(.fetchFavoriteFeeds, FavoriteFeedListResponse.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
