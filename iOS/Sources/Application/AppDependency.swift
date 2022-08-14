import Foundation

struct AppDependency {
    let mainView: MainView
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let homeView = HomeView()
        let searchView = SearchView()
        let writeView = WriteView()
        let profileView = ProfileView()

        let mainView = MainView(
            homeView: homeView,
            searchView: searchView,
            writeView: writeView,
            profileView: profileView
            )

        return AppDependency(mainView: mainView)
    }
}
