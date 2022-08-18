import Foundation

struct AppDependency {
    let mainView: MainView
    let editProfileView: EditProfileView
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let homeViewModel = HomeViewModel()
        let profileViewModel = ProfileViewModel()
        let editProfileViewModel = EditProfileViewModel()

        let homeView = HomeView(viewModel: homeViewModel)
        let searchView = SearchView()
        let writeView = WriteView()
        let profileView = ProfileView(viewModel: profileViewModel)
        let editProfileView = EditProfileView(viewModel: editProfileViewModel)

        let mainView = MainView(
            homeView: homeView,
            searchView: searchView,
            writeView: writeView,
            profileView: profileView
            )

        return AppDependency(
            mainView: mainView,
            editProfileView: editProfileView
        )
    }
}
