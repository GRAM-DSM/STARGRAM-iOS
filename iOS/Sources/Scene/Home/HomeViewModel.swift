import Foundation

import Combine
import Service

class HomeViewModel: ObservableObject {
    @Published var feeds: [Feed] = []
    @Published var isNotProfile: Bool = false

    private let fetchFeedsUseCase: FetchFeedsUseCase
    private let fetchProfileUseCase: FetchProfileUseCase

    init(
        fetchFeedsUseCase: FetchFeedsUseCase,
        fetchProfileUseCase: FetchProfileUseCase
    ) {
        self.fetchFeedsUseCase = fetchFeedsUseCase
        self.fetchProfileUseCase = fetchProfileUseCase
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

    func checkUserHaveProfile() {
        self.fetchProfileUseCase.excute()
            .catch { error -> Empty<Profile, Never> in
                if error == .notFound {
                    self.isNotProfile = true
                }
                return .init()
            }
            .sink { _ in
                self.isNotProfile = false
            }
            .store(in: &bag)
    }
}
