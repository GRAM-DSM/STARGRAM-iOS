import Foundation

import Service

struct AppDependency {
    let mainView: MainView
}

extension AppDependency {
    static func resolve() -> AppDependency {
<<<<<<< HEAD
        // MARK: Repotistory
        let authDependency = AuthServiceDependency.resolve()
=======
        // MARK: Dependency
        let authServiceDependency = AuthServiceDependency.resolve()
>>>>>>> origin/develop
        // MARK: ViewModels
        let homeViewModel = HomeViewModel()
        let profileViewModel = ProfileViewModel()
        let editProfileViewModel = EditProfileViewModel()
<<<<<<< HEAD
        let loginViewModel = LoginViewModel(
            signInUseCase: authDependency.signInUseCase
        )
        let signUpViewModel = SignUpViewModel()
=======
        let loginViewModel = LoginViewModel()
        let signUpViewModel = SignUpViewModel(
            checkIdUseCase: authServiceDependency.checkIdUseCase,
            verificationEmailUseCase: authServiceDependency.verificationEmailUseCase,
            checkVerificationEmailUseCase: authServiceDependency.checkVerificationEmailUseCase,
            signupUseCase: authServiceDependency.signUpUseCase
        )
>>>>>>> origin/develop
        let writeViewModel = WriteViewModel()
        let searchViewModel = SearchViewModel()

        // MARK: View
        let homeView = HomeView(
            viewModel: homeViewModel
        )
        let searchView = SearchView(
            viewModel: searchViewModel
        )
        let writeView = WriteView(
            viewModel: writeViewModel
        )
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
            viewModel: loginViewModel,
            mainView: mainView
        )
        _ = SignUpView(
            viewModel: signUpViewModel
        )

        return AppDependency(
            mainView: mainView
        )
    }
}
