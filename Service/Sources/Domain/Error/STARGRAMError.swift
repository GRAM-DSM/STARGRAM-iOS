import Foundation

import Moya

public enum STARGRAMError: Int, Error {
    case success = 200
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case timeout = 408
    case conflict = 409
    case tooManyRequest = 429
    case fail = 0

    init(_ error: MoyaError) {
        let statusCode = error.response?.statusCode
        let networkError = STARGRAMError(rawValue: statusCode!)
        self = networkError ?? .fail
    }

    init(_ error: Error) {
        if let moyaError = error as? MoyaError {
            self = STARGRAMError(moyaError)
        } else {
            self = .fail
        }
    }
}
