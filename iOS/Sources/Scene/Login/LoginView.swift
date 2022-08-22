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
            ButtonView(
                isDisabled: .constant(viewModel.id.isEmpty || viewModel.password.isEmpty),
                action: { })
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
