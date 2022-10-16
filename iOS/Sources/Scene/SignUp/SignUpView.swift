import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: 90)
            SignUpTitle()
                .padding(.bottom, 15)
            ScrollView {
                VStack(spacing: 15) {
                    SignUpTextField(
                        title: "ID",
                        placeholder: "아이디",
                        text: $viewModel.id,
                        message: .constant(""),
                        messageColor: .constant(.red),
                        buttonTitle: "중복확인",
                        action: { },
                        buttonWidth: 70
                    )
                    AuthTextField(
                        title: "password",
                        placeholder: "비밀번호",
                        text: $viewModel.password,
                        message: .constant("")
                    )
                    .padding(.horizontal, 46)
                    AuthTextField(
                        title: "confirm password",
                        placeholder: "비밀번호 확인",
                        isSecret: true,
                        text: $viewModel.checkPassword,
                        message: .constant("")
                    )
                    .padding(.horizontal, 46)
                    SignUpTextField(
                        title: "e-mail",
                        placeholder: "e-mail",
                        text: $viewModel.email,
                        message: .constant(""),
                        messageColor: .constant(.red),
                        buttonTitle: "인증코드 발송",
                        action: { },
                        buttonWidth: 99
                    )
                    SignUpTextField(
                        title: "email code",
                        placeholder: "인증코드",
                        text: $viewModel.authCode,
                        message: .constant(""),
                        messageColor: .constant(.red),
                        buttonTitle: "확인",
                        action: { },
                        buttonWidth: 70
                    )
                    AuthButton(
                        isDisabled: .constant(true),
                        text: "회원가입",
                        action: { }
                    )
                    .padding(.horizontal, 46)
                    .frame(height: 51)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignUpViewModel()
        SignUpView(viewModel: viewModel)
    }
}
