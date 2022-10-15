import Foundation

import Combine

protocol ProfileRepository {
    func writeProfile(image: Data, name: String, introduce: String, link: String) -> AnyPublisher<Void, STARGRAMError>
    func patchProfile(image: Data, name: String, introduce: String, link: String) -> AnyPublisher<Void, STARGRAMError>
    func deleteProfileImage() -> AnyPublisher<Void, STARGRAMError>
    func fetchProfile() -> AnyPublisher<Profile, STARGRAMError>
    func fetchWritingFeeds() -> AnyPublisher<[Feed], STARGRAMError>
    func fetchFavoriteFeeds() -> AnyPublisher<[Feed], STARGRAMError>
}
