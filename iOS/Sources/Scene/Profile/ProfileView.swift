import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    @Environment(\.tabbarHidden) var tabbarHidden
    @State var writingButtonIsClick: Bool = true
    @State var bookmarkButtonIsClick: Bool = false
    var editProfileView: EditProfileView

    var body: some View {
        NavigationView {
            VStack {
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
                    HomeListCell(action: { }, item: feed)
                }
                .listStyle(.inset)
                .padding(.horizontal, 16)
            }
            .onAppear {
                viewModel.fetchProfile()
                viewModel.fetchWritingFeeds()
                tabbarHidden.wrappedValue = false
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
