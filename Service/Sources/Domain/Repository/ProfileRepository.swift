import Foundation

import RxSwift

protocol ProfileRepository {
    func writeProfile(_ image: Data, _ name: String, _ introduce: String, _ link: String) -> Completable
    func patchProfile(_ image: Data, _ name: String, _ introduce: String, _ link: String) -> Completable
    func deleteProfileImage() -> Completable
    func fetchProfile() -> Single<Profile>
    func fetchWritingFeeds() -> Observable<[Feed]>
    func fetchFavoriteFeeds() -> Observable<[Feed]>
}
