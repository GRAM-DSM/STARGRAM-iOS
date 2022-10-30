import Foundation

import Combine
import Service

class HomeViewModel: ObservableObject {
    @Published var feeds: [Feed] = []

    private let fetchFeedsUseCase: FetchFeedsUseCase

    init(fetchFeedsUseCase: FetchFeedsUseCase) {
        self.fetchFeedsUseCase = fetchFeedsUseCase
    }

    private var bag = Set<AnyCancellable>()

    func fetchFeeds() {
        self.fetchFeedsUseCase.excute()
            .catch { error -> Empty<[Feed], Never> in
                print(error)
                return .init()
            }
            .sink {
                self.feeds = $0
            }
            .store(in: &bag)
    }
}
