import Foundation

import RxSwift
import Moya

class ProfileRepositoryImpl: ProfileRepository {

    private let remoteProfileDataSource = RemoteProfileDataSource.shared

    func writeProfile(
        _ image: Data,
        _ name: String,
        _ introduce: String,
        _ link: String
    ) -> Completable {
        return remoteProfileDataSource.writeProfile(.init(
            image: image,
            name: name,
            introduce: introduce,
            link: link
        ))
    }

    func patchProfile(
        _ image: Data,
        _ name: String,
        _ introduce: String,
        _ link: String
    ) -> Completable {
        return remoteProfileDataSource.patchProfile(.init(
            image: image,
            name: name,
            introduce: introduce,
            link: link
        ))
    }

    func deleteProfileImage() -> Completable {
        return remoteProfileDataSource.deleteProfileImage()
    }

    func fetchProfile() -> Single<Profile> {
        return remoteProfileDataSource.fetchProfile()
    }

    func fetchWritingFeeds() -> Observable<[Feed]> {
        return remoteProfileDataSource.fetchWritingFeeds()
            .asObservable()
    }

    func fetchFavoriteFeeds() -> Observable<[Feed]> {
        return remoteProfileDataSource.fetchFavoriteFeeds()
            .asObservable()
    }
}
