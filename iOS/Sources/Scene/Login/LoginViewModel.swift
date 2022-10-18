import Foundation

import Combine
import Service

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isSuccess: Bool = false
    @Published var isDisabled: Bool = true

    private let signInUseCase: SignInUseCase

    init(signInUseCase: SignInUseCase) {
        self.signInUseCase = signInUseCase
    }

    private var bag = Set<AnyCancellable>()

    func login() {
        signInUseCase.excute(id: id, password: password)
            .catch { error -> Empty<Void, Never> in
                print(error)
                self.isSuccess = false
                self.errorMessage = "아이디 또는 비밀번호가 일치하지 않습니다:("
                return .init()
            }
            .sink {
                self.isSuccess = true
                self.errorMessage = ""
            }
            .store(in: &bag)
    }

    func isEmptyTextFields() {
        isDisabled = id.isEmpty || password.isEmpty
    }
}
