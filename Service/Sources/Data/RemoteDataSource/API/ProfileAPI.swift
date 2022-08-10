import Foundation

import Moya

enum ProfileAPI {
    case writeProfile(_ request: ProfileRequest)
    case patchProfile(_ request: ProfileRequest)
    case deleteProfileImage
    case fetchProfile
    case fetchWritingFeeds
    case fetchFavoriteFees
}

extension ProfileAPI: StarGramAPI {

    var domain: ApiDomain {
        return .profiles
    }

    var urlPath: String {
        switch self {
        case .fetchWritingFeeds:
            return "/feeds"
        case .fetchFavoriteFees:
            return "/favorites"
        default:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .writeProfile:
            return .post
        case .patchProfile:
            return .patch
        case .deleteProfileImage:
            return .delete
        default:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .patchProfile(let request), .writeProfile(let request):
            var multiformData = [MultipartFormData]()
            multiformData.append(.init(
                provider: .data(request.image),
                name: "image",
                fileName: "image.jpg",
                mimeType: "image/jpg"
            ))
            multiformData.append(.init(
                provider: .data(request.name.data(using: .utf8)!),
                name: "name",
                mimeType: "text/plain"
            ))
            multiformData.append(.init(
                provider: .data(request.introduce.data(using: .utf8)!),
                name: "introduce",
                mimeType: "text/plain"
            ))
            multiformData.append(.init(
                provider: .data(request.link.data(using: .utf8)!),
                name: "link",
                mimeType: "text/plain"
            ))
            return .uploadMultipart(multiformData)
        default:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        let token = KeychainService.shared.fetchAccessToken() ?? ""
        switch self {
        case .writeProfile, .patchProfile:
            return ["Authorization": "Bearer \(token)", "Content-Type": "multipart/form-data"]
        default:
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
