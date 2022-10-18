import SwiftUI

import Service

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 129)
            SignUpTitle()
                .padding(.bottom, 15)
            ScrollView {
                VStack(spacing: 15) {
                    SignUpTextField(
                        title: "ID",
                        placeholder: "아이디",
                        text: $viewModel.id,
                        message: $viewModel.idMessage,
                        messageColor: $viewModel.idMessageColor,
                        buttonTitle: "중복확인",
                        action: {
                            viewModel.checkId()
                        },
                        buttonWidth: 70
                    )
                    AuthTextField(
                        title: "password",
                        placeholder: "비밀번호",
                        text: $viewModel.password,
                        message: $viewModel.passwordMessage
                    )
                    .onChange(of: viewModel.password) { _ in
                        viewModel.checkPasswordIsEqual()
                    }
                    AuthTextField(
                        title: "confirm password",
                        placeholder: "비밀번호 확인",
                        isSecret: true,
                        text: $viewModel.checkPassword,
                        message: $viewModel.checkPasswordMessage
                    )
                    .onChange(of: viewModel.checkPassword) { _ in
                        viewModel.checkPasswordIsEqual()
                    }
                    SignUpTextField(
                        title: "e-mail",
                        placeholder: "e-mail",
                        text: $viewModel.email,
                        message: $viewModel.emailMessage,
                        messageColor: $viewModel.emailMessageColor,
                        buttonTitle: "인증코드 발송",
                        action: {
                            viewModel.verificationEmail()
                        },
                        buttonWidth: 99
                    )
                    SignUpTextField(
                        title: "email code",
                        placeholder: "인증코드",
                        text: $viewModel.authCode,
                        message: $viewModel.authCodeMessage,
                        messageColor: $viewModel.authCodeMessageColor,
                        buttonTitle: "확인",
                        action: {
                            viewModel.checkVerificationEmail()
                        },
                        buttonWidth: 70
                    )
                    AuthButton(
                        isDisabled: $viewModel.isDisabled,
                        text: "회원가입",
                        action: {
                            viewModel.signup()
                        }
                    )
                    .frame(height: 51)
                }
                .padding(.horizontal, 46)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        let authService = AuthServiceDependency.resolve()
        let viewModel = SignUpViewModel(
            checkIdUseCase: authService.checkIdUseCase,
            verificationEmailUseCase: authService.verificationEmailUseCase,
            checkVerificationEmailUseCase: authService.checkVerificationEmailUseCase,
            signupUseCase: authService.signUpUseCase
        )
        SignUpView(viewModel: viewModel)
    }
}
