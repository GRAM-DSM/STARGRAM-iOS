import Foundation

import Combine

public class LogoutUseCase {
    let keychainService = KeychainService.shared

    func excute() -> Empty<Void, Never> {
        keychainService.deleteToken()
        return .init()
    }
}
