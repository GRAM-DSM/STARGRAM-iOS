import SwiftUI

import Service

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    let mainView: MainView
    let signupView: SignUpView

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 150)
                LoginTitle()
                Spacer()
                AuthTextField(
                    placeholder: "아이디",
                    text: $viewModel.id
                )
                .onChange(of: viewModel.id) { _ in
                    viewModel.isEmptyTextFields()
                }
                AuthTextField(
                    placeholder: "비밀번호",
                    isSecret: true,
                    text: $viewModel.password,
                    message: $viewModel.errorMessage
                )
                .onChange(of: viewModel.password) { _ in
                    viewModel.isEmptyTextFields()
                }
                Spacer()
                    .frame(height: 40)
                ButtonView(
                    isDisabled: $viewModel.isDisabled,
                    isActive: $viewModel.isSuccess,
                    mainView: mainView,
                    signupView: signupView
                ) {
                    viewModel.login()
                }
                Spacer()
            }
            .padding(.horizontal, 46)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
