import Foundation

import Moya

public enum STARGRAMError: Error {
    case unauthorization
    case badRequest
    case notFound
    case timeOut
    case conflict
    case tooManyRequest
    case emailOutTheStyle
}
