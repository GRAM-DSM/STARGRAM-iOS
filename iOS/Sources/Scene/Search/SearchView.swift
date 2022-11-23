import SwiftUI

import Service

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel

    var body: some View {
        NavigationView {
            ZStack {
                if !viewModel.searchList.isEmpty {
                    VStack(spacing: 0) {
                        Spacer()
                            .frame(height: 18)
                        HStack {
                            Text("검색어")
                                .font(.button500)
                                .foregroundColor(.gray1)
                            Spacer()
                        }
                        .padding(.leading, 33)
                        List(
                            viewModel.searchList,
                            id: \.feedId
                        ) {
                            SearchListCell(
                                search: $0.title,
                                searchText: $viewModel.searchText
                            )
                        }
                        .listStyle(.inset)
                    }
                }
                if viewModel.searchText.isEmpty {
                    VStack {
                        Text("최근 검색 내역이 없습니다.")
                            .font(.body400)
                            .foregroundColor(.gray1)
                            .padding(.top, 30)
                        Spacer()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    SearchBar(
                        action: {
                            print("search")
                        },
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SearchViewModel(
            searchUseCase: SearchServiceDependency.resolve().searchUseCase)
        SearchView(viewModel: viewModel)
    }
}
