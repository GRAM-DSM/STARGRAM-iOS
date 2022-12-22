import SwiftUI

import Introspect
import Service

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @Environment(\.tabbarHidden) var tabbarHidden
    let postProfileView: PostProfileView
    var feedDetailView: FeedDetailView

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 24)
                HomeTitle()
                Image("BackImage")
                    .padding(.horizontal, 16)
                List(viewModel.feeds, id: \.id) { feed in
                    ZStack {
                        HomeListCell(action: { viewModel.id = feed.id }, item: feed)
                            .frame(height: 57)
                        NavigationLink(destination: self.feedDetailView) {
                            EmptyView()
                        }
                        .opacity(0)
                        .buttonStyle(.plain)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.inset)
                .padding(.horizontal, 16)
            }
            .onDisappear { feedDetailView.viewModel.id = viewModel.id }
            .onAppear {
                tabbarHidden.wrappedValue = false
                viewModel.fetchFeeds()
                viewModel.checkUserHaveProfile()
            }
            .fullScreenCover(isPresented: $viewModel.isNotProfile) {
                postProfileView
            }
        }
    }
}
