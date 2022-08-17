import Foundation

struct AppDependency {
    let mainView: MainView
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let homeViewModel = HomeViewModel()
        let profileViewModel = ProfileViewModel()

        let homeView = HomeView(viewModel: homeViewModel)
        let searchView = SearchView()
        let writeView = WriteView()
        let profileView = ProfileView(viewModel: profileViewModel)

        let mainView = MainView(
            homeView: homeView,
            searchView: searchView,
            writeView: writeView,
            profileView: profileView
            )

        return AppDependency(mainView: mainView)
    }
}
