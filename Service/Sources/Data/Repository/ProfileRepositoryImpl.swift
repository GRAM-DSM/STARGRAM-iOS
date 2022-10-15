import Foundation

import Combine
import Moya

class ProfileRepositoryImpl: ProfileRepository {

    private let remoteProfileDataSource = RemoteProfileDataSource.shared

    func writeProfile(
        image: Data,
        name: String,
        introduce: String,
        link: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return remoteProfileDataSource.writeProfile(.init(
            image: image,
            name: name,
            introduce: introduce,
            link: link
        ))
    }

    func patchProfile(
        image: Data,
        name: String,
        introduce: String,
        link: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return remoteProfileDataSource.patchProfile(.init(
            image: image,
            name: name,
            introduce: introduce,
            link: link
        ))
    }

    func deleteProfileImage() -> AnyPublisher<Void, STARGRAMError> {
        return remoteProfileDataSource.deleteProfileImage()
    }

    func fetchProfile() -> AnyPublisher<Profile, STARGRAMError> {
        return remoteProfileDataSource.fetchProfile()
    }

    func fetchWritingFeeds() -> AnyPublisher<[Feed], STARGRAMError> {
        return remoteProfileDataSource.fetchWritingFeeds()
    }

    func fetchFavoriteFeeds() -> AnyPublisher<[Feed], STARGRAMError> {
        return remoteProfileDataSource.fetchFavoriteFeeds()
    }
}
