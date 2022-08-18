import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HomeViewModel()
        HomeView(viewModel: viewModel)
    }
}
