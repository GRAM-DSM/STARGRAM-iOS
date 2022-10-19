import SwiftUI

import Service

struct LaunchScreenView: View {
    @StateObject var viewModel: LaunchScreenViewModel
    let mainView: MainView
    let loginView: LoginView

    var body: some View {
        VStack(alignment: .center) {
            Image("TitleImage")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .fullScreenCover(isPresented: $viewModel.autoLoginIsSuccess) {
            mainView
        }
        .fullScreenCover(isPresented: $viewModel.autoLoginIsFail) {
            loginView
        }
        .background(Color.orange1)
        .ignoresSafeArea()
        .onAppear {
            viewModel.autoLogin()
        }
    }
}
