import Foundation

import KeychainSwift

final class KeychainDataSource {

    static let shared = KeychainDataSource()

    private let keychainSwift = KeychainSwift()

    public init() { }

    func registerToken(_ token: String, tokenType: JWTTokenType) {
        keychainSwift.delete("\(tokenType)")
        keychainSwift.set(token, forKey: "\(tokenType)")
    }

    func fetchToken(tokenType: JWTTokenType) -> String? {
        return keychainSwift.get("\(tokenType)")
    }

    func deleteToken(tokenType: JWTTokenType) {
        keychainSwift.delete("\(tokenType)")
    }
}
