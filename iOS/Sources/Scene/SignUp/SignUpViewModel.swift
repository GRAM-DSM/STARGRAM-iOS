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
    @Published var isDisabled: Bool = false
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
            .sink { error in
                print(error)
                self.idMessage = error.hashValue == 409 ? "중복된 아이디입니다:(" : ""
                self.idMessageColor = .red
                self.idIsNotOverlap = false
            } receiveValue: { _ in
                self.idMessageColor = .green
                self.idMessage = "사용할 수 있는 아이디입니다:)"
                self.idIsNotOverlap = true
            }
            .store(in: &bag)
    }
    func verificationEmail() {
        verificationEmailUseCase.excute(email: email)
            .sink { error in
                print(error)
                self.emailMessage = "이메일 전송에 실패하였습니다."
            } receiveValue: { _ in
                self.emailMessage = ""
            }
            .store(in: &bag)
    }
    func checkVerificationEmail() {
        checkVerificationEmailUseCase.excute(email: email, code: authCode)
            .sink { error in
                print(error)
                self.authCodeMessage = "인증번호가 일치하지 않습니다."
                self.authCodeMessageColor = .red
                self.authCodeIsSuccess = false
            } receiveValue: { _ in
                self.authCodeMessage = "인증이 완료되었습니다."
                self.authCodeMessageColor = .green
                self.authCodeIsSuccess = true
            }
            .store(in: &bag)
    }
    func signup() {
        signupUseCase.excute(id: id, password: password, email: email)
            .sink { error in
                print(error)
                self.isSuccess = false
            } receiveValue: { _ in
                self.isSuccess = true
            }
            .store(in: &bag)
    }
    func checkPasswordIsEqual() {
        self.passwordIsEqual = password == checkPassword
        self.passwordMessage = isPasswordCheck() ? "" : "비밀번호는 8~20자 내로 특수문자 1개 이상 포함하여 입력하세요."
        self.checkPasswordMessage = password == checkPassword ? "" : "비밀번호가 일치하지 않습니다."
    }
    func signupIsDisabled() {
        self.isDisabled = !passwordIsEqual || !authCodeIsSuccess || !idIsNotOverlap
    }
    private func isPasswordCheck() -> Bool {
        let strRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{6,30}"
        let pred = NSPredicate(format: "SELF MATCHES %@", strRegEx)

        return pred.evaluate(with: self.password)
    }
}
