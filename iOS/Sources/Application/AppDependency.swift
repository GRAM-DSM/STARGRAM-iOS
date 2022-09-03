import Foundation

struct AppDependency {
    let mainView: MainView
}

extension AppDependency {
    static func resolve() -> AppDependency {
        // MARK: ViewModels
        let homeViewModel = HomeViewModel()
        let profileViewModel = ProfileViewModel()
        let editProfileViewModel = EditProfileViewModel()
        let loginViewModel = LoginViewModel()
        let signUpViewModel = SignUpViewModel()
        let writeViewModel = WriteViewModel()

        // MARK: View
        let homeView = HomeView(
            viewModel: homeViewModel
        )
        let searchView = SearchView()
        let writeView = WriteView(viewModel: writeViewModel)
        let editProfileView = EditProfileView(
            viewModel: editProfileViewModel
        )
        let profileView = ProfileView(
            viewModel: profileViewModel,
            editProfileView: editProfileView
        )
        let mainView = MainView(
            homeView: homeView,
            searchView: searchView,
            writeView: writeView,
            profileView: profileView
            )
        _ = LoginView(
            viewModel: loginViewModel
        )
        _ = SignUpView(
            viewModel: signUpViewModel
        )

        return AppDependency(
            mainView: mainView
        )
    }
}
