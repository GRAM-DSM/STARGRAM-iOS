import Foundation

import Combine
import Service

class LaunchScreenViewModel: ObservableObject {
    @Published var autoLoginIsSuccess: Bool = false
    @Published var autoLoginIsFail: Bool = false

    private let refreshTokenUseCase: RefreshTokenUseCase

    init(refreshTokenUseCase: RefreshTokenUseCase) {
        self.refreshTokenUseCase = refreshTokenUseCase
    }

    private var bag = Set<AnyCancellable>()

    func autoLogin() {
        self.refreshTokenUseCase.excute()
            .catch { error -> Empty<Void, Never> in
                print(error)
                self.autoLoginIsFail = true
                return .init()
            }
            .sink {
                self.autoLoginIsSuccess = true
            }
            .store(in: &bag)
    }
}
