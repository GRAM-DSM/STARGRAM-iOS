import Foundation

import Moya

enum FeedAPI {
    case createFeed(_ request: CreateFeedRequest)
    case patchFeed(_ feedId: String, _ request: PatchFeedRequest)
    case deleteFeed(_ feedId: String)
    case uploadImage(_ images: [Data])
    case fetchFeeds
    case fetchFeedDetail(_ feedId: String)
    case createComment(_ feedId: String, _ comment: String)
    case patchComment(_ feedId: String, _ commentId: Int, _ comment: String)
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
            return "/bookmark/\(feedId)"
        case .patchComment(_, let commentId, _), .deleteComment(let commentId):
            return "/comments/\(commentId)"
        case .createComment(let feedId, _):
            return "/comments/\(feedId)"
        case .fetchFeeds:
            return "/list"
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
        case .createComment(_, let comment), .patchComment(_, _, let comment):
            return .requestParameters(
                parameters: [
                    "content": comment
                ],
                encoding: JSONEncoding.default
            )
        case .uploadImage(let images):
            var multiformData = [MultipartFormData]()
            for image in images {
                multiformData.append(.init(
                    provider: .data(image),
                    name: "images",
                    fileName: "images.jpg",
                    mimeType: "images/jpg"
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
