import SwiftUI

struct MainView: View {
    let homeView: HomeView
    let searchView: SearchView
    let writeView: WriteView
    let profileView: ProfileView

    var body: some View {
        TabView {
            homeView
                .tabItem {
                    Image("HomeImage")
                }
            searchView
                .tabItem {
                    Image("SearchImage")
                }
            writeView
                .tabItem {
                    Image("WriteImage")
                }
            profileView
                .tabItem {
                    Image("ProfileImage")
                }
        }
        .navigationBarBackButtonHidden()
    }
}
