import Foundation

import Combine
import Moya

class FeedRepositoryImpl: FeedRepository {

    private let remoteFeedDataSource = RemoteFeedDataSource.shared

    func createFeed(
        title: String,
        content: String,
        category: String,
        url: [String]
    ) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.createFeed(.init(
            title: title,
            content: content,
            category: category,
            url: url
        ))
        .mapError { moyaError -> STARGRAMError in
            print(moyaError.response?.statusCode ?? 0)
            switch moyaError.response?.statusCode {
            case 401:
                return .unauthorization
            case 429:
                return .tooManyRequest
            default:
                return .badRequest
            }
        }
        .eraseToAnyPublisher()
    }

    func patchFeed(
        feedId: String,
        title: String,
        content: String
    ) -> AnyPublisher<Void, STARGRAMError> {
            return remoteFeedDataSource.patchFeed(
                feedId,
                .init(
                    title: title,
                    content: content
                )
            )
            .mapError { moyaError -> STARGRAMError in
                print(moyaError.response?.statusCode ?? 0)
                switch moyaError.response?.statusCode {
                case 401:
                    return .unauthorization
                case 429:
                    return .tooManyRequest
                default:
                    return .badRequest
                }
            }
            .eraseToAnyPublisher()
    }

    func deleteFeed(feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.deleteFeed(feedId)
            .mapError { moyaError -> STARGRAMError in
                print(moyaError.response?.statusCode ?? 0)
                switch moyaError.response?.statusCode {
                case 404:
                    return .notFound
                default:
                    return .badRequest
                }
            }
            .eraseToAnyPublisher()
    }

    func uploadImage(images: [Data]) -> AnyPublisher<FeedImage, STARGRAMError> {
        return remoteFeedDataSource.uploadImage(images)
            .mapError {
                print($0)
                return .badRequest
            }
            .eraseToAnyPublisher()
    }

    func fetchFeeds() -> AnyPublisher<[Feed], STARGRAMError> {
        return remoteFeedDataSource.fetchFeeds()
            .mapError {
                print($0)
                return .badRequest
            }
            .eraseToAnyPublisher()
    }

    func fetchFeedDetails(feedId: String) -> AnyPublisher<FeedDetail, STARGRAMError> {
        return remoteFeedDataSource.fetchFeedDetail(feedId)
            .mapError { moyaError -> STARGRAMError in
                print(moyaError.response?.statusCode ?? 0)
                switch moyaError.response?.statusCode {
                case 404:
                    return .notFound
                default:
                    return .badRequest
                }
            }
            .eraseToAnyPublisher()
    }

    func createComment(feedId: String, content: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.createComment(.init(
            feedId: feedId,
            content: content
        ))
        .mapError {
            print($0.response?.statusCode ?? 0)
            return .badRequest
        }
        .eraseToAnyPublisher()
    }

    func patchComment(
        commentId: Int,
        feedId: String,
        content: String
    ) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.patchComment(
            commentId,
            .init(
                feedId: feedId,
                content: content
            ))
        .mapError {
            print($0.response?.statusCode ?? 0)
            return .badRequest
        }
        .eraseToAnyPublisher()
    }

    func deleteComment(commentId: Int) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.deleteComment(commentId)
            .mapError {
                print($0.response?.statusCode ?? 0)
                return .notFound
            }
            .eraseToAnyPublisher()
    }

    func like(feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.like(feedId)
            .mapError {
                print($0.response?.statusCode ?? 0)
                return .notFound
            }
            .eraseToAnyPublisher()
    }

    func unLike(feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.unLike(feedId)
            .mapError {
                print($0.response?.statusCode ?? 0)
                return .notFound
            }
            .eraseToAnyPublisher()
    }

    func favorite(feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.favorite(feedId)
            .mapError {
                print($0.response?.statusCode ?? 0)
                return .notFound
            }
            .eraseToAnyPublisher()
    }

    func unFavorite(feedId: String) -> AnyPublisher<Void, STARGRAMError> {
        return remoteFeedDataSource.unFavorite(feedId)
            .mapError {
                print($0.response?.statusCode ?? 0)
                return .notFound
            }
            .eraseToAnyPublisher()
    }
}
