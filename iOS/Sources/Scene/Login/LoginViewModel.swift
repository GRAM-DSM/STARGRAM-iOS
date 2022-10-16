import Foundation

import Combine
import Service

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var isSuccess: Bool = false
    @Published var isDisabled: Bool = true

    private let signInUseCase: SignInUseCase

    init(signInUseCase: SignInUseCase) {
        self.signInUseCase = signInUseCase
    }

    private var bag = Set<AnyCancellable>()

    func login() {
        signInUseCase.excute(id: id, password: password)
            .sink { error in
                print(error.hashValue)
                self.isSuccess = false
            } receiveValue: { _ in
                self.isSuccess = true
            }
            .store(in: &bag)
    }

    func isEmptyTextFields() {
        isDisabled = id.isEmpty || password.isEmpty
    }
}
