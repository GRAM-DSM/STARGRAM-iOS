import Foundation

import Service

struct AppDependency {
    let launchScreenView: LaunchScreenView
}

// swiftlint:disable function_body_length
extension AppDependency {
    static func resolve() -> AppDependency {
        // MARK: Dependency
        let feedServiceDependency = FeedServiceDependency.resolve()
        let authServiceDependency = AuthServiceDependency.resolve()
        let profileServiceDependency = ProfileServiceDependency.resolve()
        let searchServiceDependency = SearchServiceDependency.resolve()

        // MARK: ViewModels
        let launchScreenViewModel = LaunchScreenViewModel(
            refreshTokenUseCase: authServiceDependency.refreshTokenUseCase
        )
        let homeViewModel = HomeViewModel(
            fetchFeedsUseCase: feedServiceDependency.fetchFeedsUseCase,
            fetchProfileUseCase: profileServiceDependency.fetchProfileUseCase
        )
        let profileViewModel = ProfileViewModel(
            fetchProfileUseCase: profileServiceDependency.fetchProfileUseCase
        )
        let editProfileViewModel = EditProfileViewModel(
            fetchProfileUseCase: profileServiceDependency.fetchProfileUseCase,
            patchProfileUseCase: profileServiceDependency.patchProfileUseCase
        )
        let loginViewModel = LoginViewModel(
            signInUseCase: authServiceDependency.signInUseCase
        )
        let signUpViewModel = SignUpViewModel(
            checkIdUseCase: authServiceDependency.checkIdUseCase,
            verificationEmailUseCase: authServiceDependency.verificationEmailUseCase,
            checkVerificationEmailUseCase: authServiceDependency.checkVerificationEmailUseCase,
            signupUseCase: authServiceDependency.signUpUseCase
        )
        let writeViewModel = WriteViewModel(
            uploadImageUseCase: feedServiceDependency.uploadImageUseCase,
            createFeedUseCase: feedServiceDependency.createFeedUseCase
        )
        let postProfileViewModel = PostProfileViewModel(
            writeProfileUseCase: profileServiceDependency.writeProfileUseCase
        )
        let searchViewModel = SearchViewModel(
            searchUseCase: searchServiceDependency.searchUseCase
        )
        // MARK: View
        let postProfileView = PostProfileView(
            viewModel: postProfileViewModel
        )
        let homeView = HomeView(
            viewModel: homeViewModel,
            postProfileView: postProfileView
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
        let signupView = SignUpView(
            viewModel: signUpViewModel
        )
        let loginView = LoginView(
            viewModel: loginViewModel,
            mainView: mainView,
            signupView: signupView
        )
        let launchScreenView = LaunchScreenView(
            viewModel: launchScreenViewModel,
            mainView: mainView,
            loginView: loginView
        )
        return AppDependency(
            launchScreenView: launchScreenView
        )
    }
}
