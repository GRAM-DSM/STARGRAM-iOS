import Foundation

import Combine
import Service
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var checkPassword: String = ""
    @Published var email: String = ""
    @Published var authCode: String = ""

    // MARK: Boolean
    @Published var isDisabled: Bool = true
    @Published var isSuccess: Bool = false
    @Published var idIsNotOverlap: Bool = false
    @Published var passwordIsEqual: Bool = false
    @Published var authCodeIsSuccess: Bool = false

    // MARK: Message
    @Published var idMessage: String = ""
    @Published var passwordMessage: String = ""
    @Published var checkPasswordMessage: String = ""
    @Published var emailMessage: String = ""
    @Published var authCodeMessage: String = ""

    // MARK: MessageColor
    @Published var idMessageColor: Color = .red
    @Published var emailMessageColor: Color = .red
    @Published var authCodeMessageColor: Color = .red

    private let checkIdUseCase: CheckIdUseCase
    private let verificationEmailUseCase: VerificationEmailUseCase
    private let checkVerificationEmailUseCase: CheckVerificationEmailUseCase
    private let signupUseCase: SignUpUseCase

    init(
        checkIdUseCase: CheckIdUseCase,
        verificationEmailUseCase: VerificationEmailUseCase,
        checkVerificationEmailUseCase: CheckVerificationEmailUseCase,
        signupUseCase: SignUpUseCase
    ) {
        self.checkIdUseCase = checkIdUseCase
        self.verificationEmailUseCase = verificationEmailUseCase
        self.checkVerificationEmailUseCase = checkVerificationEmailUseCase
        self.signupUseCase = signupUseCase
    }

    private var bag = Set<AnyCancellable>()

    func checkId() {
        checkIdUseCase.excute(id: id)
            .receive(on: DispatchQueue.main)
            .catch { error -> Empty<Void, Never> in
                self.idMessage = error == .conflict ? "중복된 아이디입니다:(" : ""
                self.idMessageColor = .red
                self.idIsNotOverlap = false
                return .init()
            }
            .sink(receiveValue: { _ in
                self.idMessageColor = .green
                self.idMessage = "사용할 수 있는 아이디입니다:)"
                self.idIsNotOverlap = true
                self.signupIsDisabled()
            })
            .store(in: &bag)
        print("!!!!!")
    }
    func verificationEmail() {
        verificationEmailUseCase.excute(email: email)
            .receive(on: DispatchQueue.main)
            .catch { error -> Empty<Void, Never> in
                print(error)
                self.emailMessage = "인증코드 전송에 실패하였습니다."
                self.emailMessageColor = .red
                return .init()
            }
            .sink { _ in
                self.emailMessage = "인증코드가 전송되었습니다."
                self.emailMessageColor = .green
                self.signupIsDisabled()
            }
            .store(in: &bag)
        print("!!!!!")
    }
    func checkVerificationEmail() {
        checkVerificationEmailUseCase.excute(email: email, code: authCode)
            .receive(on: DispatchQueue.main)
            .catch { error -> Empty<Void, Never> in
                print(error)
                self.authCodeMessage = "인증번호가 일치하지 않습니다."
                self.authCodeMessageColor = .red
                self.authCodeIsSuccess = false
                return .init()
            }
            .sink {
                self.authCodeMessage = "인증이 완료되었습니다."
                self.authCodeMessageColor = .green
                self.authCodeIsSuccess = true
                self.signupIsDisabled()
            }
            .store(in: &bag)
    }
    func signup() {
        signupUseCase.excute(id: id, password: password, email: email)
            .receive(on: DispatchQueue.main)
            .catch { error -> Empty<Void, Never> in
                print(error)
                self.isSuccess = false
                return .init()
            }
            .sink {
                self.isSuccess = true
            }
            .store(in: &bag)
    }
    func checkPasswordIsEqual() {
        self.passwordIsEqual = password == checkPassword
        self.passwordMessage = isPasswordCheck() ? "" : "비밀번호는 8~20자 내로 특수문자 1개 이상 포함하여 입력하세요."
        self.checkPasswordMessage = password == checkPassword ? "" : "비밀번호가 일치하지 않습니다."
    }
    private func signupIsDisabled() {
        self.isDisabled = !passwordIsEqual || !authCodeIsSuccess || !idIsNotOverlap
    }
    private func isPasswordCheck() -> Bool {
        let strRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{6,30}"
        let pred = NSPredicate(format: "SELF MATCHES %@", strRegEx)

        return pred.evaluate(with: self.password)
    }
}
