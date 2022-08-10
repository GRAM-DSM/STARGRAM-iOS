import Foundation

import Moya

enum FeedAPI {
    case createFeed(_ request: CreateFeedRequest)
    case patchFeed(_ feedId: String, _ request: PatchFeedRequest)
    case deleteFeed(_ feedId: String)
    case uploadImage(_ images: [Data])
    case fetchFeeds
    case fetchFeedDetail(_ feedId: String)
    case createComment(_ request: CommentRequest)
    case patchComment(_ commentId: Int, _ request: CommentRequest)
    case deleteComment(_ commentId: Int)
    case like(_ feedId: String)
    case unLike(_ feedId: String)
    case favorite(_ feedId: String)
    case unFavorite(_ feedId: String)
}

extension FeedAPI: StarGramAPI {

    var domain: ApiDomain {
        return .feeds
    }

    var urlPath: String {
        switch self {
        case .patchFeed(let feedId, _), .deleteFeed(let feedId), .fetchFeedDetail(let feedId):
            return "/\(feedId)"
        case .uploadImage:
            return "/image"
        case .like(let feedId), .unLike(let feedId):
            return "/likes/\(feedId)"
        case .favorite(let feedId), .unFavorite(let feedId):
            return "/favorites/\(feedId)"
        case .patchComment(let commentId, _), .deleteComment(let commentId):
            return "/comments/\(commentId)"
        case .createFeed:
            return "/comments"
        default:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .patchFeed, .patchComment:
            return .patch
        case .deleteFeed, .deleteComment, .unLike, .unFavorite:
            return .delete
        case .fetchFeeds, .fetchFeedDetail:
            return .get
        default:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .createFeed(let request):
            return .requestJSONEncodable(request)
        case .patchFeed(_, let request):
            return .requestJSONEncodable(request)
        case .createComment(let request), .patchComment(_, let request):
            return .requestJSONEncodable(request)
        case .uploadImage(let images):
            var multiformData = [MultipartFormData]()
            for image in images {
                multiformData.append(.init(
                    provider: .data(image),
                    name: "image",
                    fileName: "image.jpg",
                    mimeType: "image/jpg"
                ))
            }
            return .uploadMultipart(multiformData)
        default:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        let token = KeychainService.shared.fetchAccessToken() ?? ""
        switch self {
        case .uploadImage:
            return ["Authorization": "Bearer \(token)", "Content-Type": "multipart/form-data"]
        default:
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
