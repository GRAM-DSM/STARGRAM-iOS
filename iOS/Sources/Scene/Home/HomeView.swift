import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    let postProfileView: PostProfileView

    var body: some View {
        VStack(spacing: 3) {
            Spacer()
                .frame(height: 24)
            HomeTitle()
            Image("BackImage")
                .padding(.horizontal, 16)
            List(viewModel.feeds, id: \.id) { feed in
                HomeListCell(item: feed)
            }
            .listStyle(.inset)
            .padding(.horizontal, 16)
        }
        .onAppear {
            viewModel.fetchFeeds()
            viewModel.checkUserHaveProfile()
        }
        .fullScreenCover(isPresented: $viewModel.isNotProfile) {
            postProfileView
        }
    }
}
