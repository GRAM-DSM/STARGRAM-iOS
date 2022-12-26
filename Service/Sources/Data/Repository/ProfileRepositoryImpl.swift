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
        .mapError {
            print($0.response?.statusCode ?? 0)
            return .badRequest
        }
        .eraseToAnyPublisher()
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
        .mapError {
            print($0.response?.statusCode ?? 0)
            return .badRequest
        }
        .eraseToAnyPublisher()
    }

    func deleteProfileImage() -> AnyPublisher<Void, STARGRAMError> {
        return remoteProfileDataSource.deleteProfileImage()
            .mapError {
                print($0.response?.statusCode ?? 0)
                return .notFound
            }
            .eraseToAnyPublisher()
    }

    func fetchProfile() -> AnyPublisher<Profile, STARGRAMError> {
        return remoteProfileDataSource.fetchProfile()
            .mapError {
                print($0.response?.statusCode ?? 0)
                return .notFound
            }
            .eraseToAnyPublisher()
    }

    func fetchWritingFeeds() -> AnyPublisher<[Feed], STARGRAMError> {
        return remoteProfileDataSource.fetchWritingFeeds()
            .mapError {
                print($0)
                print($0.response?.statusCode ?? 0)
                return .notFound
            }
            .eraseToAnyPublisher()
    }

    func fetchFavoriteFeeds() -> AnyPublisher<[Feed], STARGRAMError> {
        return remoteProfileDataSource.fetchFavoriteFeeds()
            .mapError {
                print($0)
                print($0.response?.statusCode ?? 0)
                return .notFound
            }
            .eraseToAnyPublisher()
    }
}
