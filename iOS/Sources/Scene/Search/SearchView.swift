import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    @Environment(\.tabbarHidden) var tabbarHidden
    let feedDetailView: FeedDetailView

    var body: some View {
        NavigationView {
            ZStack {
                if !viewModel.searchList.isEmpty {
                    VStack(
                        alignment: .leading,
                        spacing: 0
                    ) {
                        Spacer()
                            .frame(height: 18)
                        Text("검색어")
                            .font(.button500)
                            .foregroundColor(.gray1)
                            .padding(.leading, 33)
                        LazyVStack {
                            ForEach(viewModel.searchList, id: \.feedId) { search in
                                NavigationLink(destination: self.feedDetailView) {
                                    SearchListCell(
                                        search: search.title,
                                        searchText: $viewModel.searchText
                                    )
                                    .onDisappear {
                                        viewModel.id = search.feedId
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                } else {
                    VStack {
                        Text("최근 검색 내역이 없습니다.")
                            .font(.body400)
                            .foregroundColor(.gray1)
                            .padding(.top, 30)
                        Spacer()
                    }
                }
            }
            .onDisappear { feedDetailView.viewModel.id = viewModel.id }
            .onAppear { tabbarHidden.wrappedValue = false }
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: viewModel.searchText) { _ in
                viewModel.searchList = []
                viewModel.fetchSearchList()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    SearchBar(
                        action: viewModel.fetchSearchList,
                        text: $viewModel.searchText
                    )
                }
            }
            .navigationBarColor(
                .orange1,
                textColor: .white
            )
        }
        .hideKeyboard()
    }
}
