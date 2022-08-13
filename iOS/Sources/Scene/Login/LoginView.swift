import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    @State var entry: Bool = false

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 150)
            LoginTitle()
            Spacer()
                .frame(minHeight: 0, maxHeight: 120)
            LoginTextFieldView(
                id: $viewModel.id,
                password: $viewModel.password
            )
            Spacer()
                .frame(height: 40)
            LoginButton(
                action: {
                    print("로그인")
                },
                isDisable: .constant(viewModel.id == "" || viewModel.password == "")
            )
            Spacer()
                .frame(height: 14)
            MoveSignUpButton()
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LoginViewModel()
        LoginView(viewModel: viewModel)
    }
}
