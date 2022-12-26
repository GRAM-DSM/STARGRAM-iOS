import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    @Environment(\.tabbarHidden) var tabbarHidden
    @State var writingButtonIsClick: Bool = true
    @State var bookmarkButtonIsClick: Bool = false
    let editProfileView: EditProfileView
    let feedDetailView: FeedDetailView

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 37)
                ProfileDataView(
                    editProfileView: editProfileView,
                    profile: viewModel.profile
                )
                Spacer()
                    .frame(height: 31)
                ProfileButtonView(
                    action1: {
                        viewModel.fetchWritingFeeds()
                        writingButtonIsClick = true
                        bookmarkButtonIsClick = false
                    },
                    action2: {
                        viewModel.fetchBookmarkFeeds()
                        writingButtonIsClick = false
                        bookmarkButtonIsClick = true
                    },
                    isClick1: $writingButtonIsClick,
                    isClick2: $bookmarkButtonIsClick
                )
                Spacer()
                    .frame(height: 15)
                HStack {
                    Spacer()
                        .frame(width: 41)
                    Text("\(viewModel.feeds.count)개의 게시글이 있습니다.")
                        .font(.small100)
                        .foregroundColor(.gray1)
                    Spacer()
                }
                List(viewModel.feeds, id: \.id) { feed in
                    ZStack {
                        NavigationLink(destination: feedDetailView) {
                            EmptyView()
                        }
                        .opacity(0)
                        .buttonStyle(.plain)
                        HomeListCell(action: { viewModel.id = feed.id }, item: feed)
                            .frame(height: 57)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.inset)
                .padding(.horizontal, 16)
            }
            .onDisappear { feedDetailView.viewModel.id = viewModel.id }
            .onAppear {
                viewModel.fetchProfile()
                viewModel.fetchWritingFeeds()
                tabbarHidden.wrappedValue = false
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
