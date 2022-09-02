import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
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
                    action1: print(""),
                    action2: print("")
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
                    HomeListCell(item: feed)
                }
                .listStyle(.inset)
                .padding(.horizontal, 16)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
