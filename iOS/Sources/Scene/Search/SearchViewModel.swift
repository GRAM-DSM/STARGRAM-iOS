import Foundation

import Combine
import Service

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var searchList: [Search] = []
    @Published var id: String = ""

    private let searchUseCase: SearchUseCase

    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
    }

    private var bag = Set<AnyCancellable>()

    func fetchSearchList() {
        self.searchUseCase.excute(keyword: searchText)
            .catch { error -> Empty<[Search], Never> in
                print(error)
                return .init()
            }
            .sink { [weak self] in
                self?.searchList = $0
            }
            .store(in: &bag)
    }
}
