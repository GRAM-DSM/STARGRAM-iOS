import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel

    var body: some View {
        NavigationView {
            VStack {
                Text("검색화면입니다.")
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
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SearchViewModel()
        SearchView(viewModel: viewModel)
    }
}
