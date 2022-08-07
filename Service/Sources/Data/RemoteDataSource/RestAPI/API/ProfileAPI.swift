import Foundation

import Moya

enum ProfileAPI {
    case postProfile(_ image: Data, _ name: String, _ introduce: String, _ link: String)
    case patchProfile(_ image: Data, _ name: String, _ introduce: String, _ link: String)
    case deleteProfileImage
    case fetchProfile
    case fetchWritingFeeds
    case fetchBookMarkFeeds
}

extension ProfileAPI: StarGramAPI {
    var domain: ApiDomain {
        return .profiles
    }

    var urlPath: String {
        switch self {
        case .fetchWritingFeeds:
            return "/feeds"
        case .fetchBookMarkFeeds:
            return "/favorites"
        default:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .postProfile:
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
        case .postProfile(let image, let name, let introduce, let link):
            var multiformData = [MultipartFormData]()
            multiformData.append(.init(provider: .data(image), name: "image", fileName: "image.jpg", mimeType: "image/jpg"))
            multiformData.append(.init(provider: .data(name.data(using: .utf8)!), name: "name", mimeType: "text/plain"))
            multiformData.append(.init(provider: .data(introduce.data(using: .utf8)!), name: "introduce", mimeType: "text/plain"))
            multiformData.append(.init(provider: .data(link.data(using: .utf8)!), name: "link", mimeType: "text/plain"))
            return .uploadMultipart(multiformData)
        case .patchProfile(let image, let name, let introduce, let link):
            var multiformData = [MultipartFormData]()
            multiformData.append(.init(provider: .data(image), name: "image", fileName: "image.jpg", mimeType: "image/jpg"))
            multiformData.append(.init(provider: .data(name.data(using: .utf8)!), name: "name", mimeType: "text/plain"))
            multiformData.append(.init(provider: .data(introduce.data(using: .utf8)!), name: "introduce", mimeType: "text/plain"))
            multiformData.append(.init(provider: .data(link.data(using: .utf8)!), name: "link", mimeType: "text/plain"))
            return .uploadMultipart(multiformData)
        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JWTTokenType {
        return .accessToken
    }
    
    
}
