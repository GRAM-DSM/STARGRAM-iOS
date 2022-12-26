import Foundation

import Service
import Combine

class ProfileViewModel: ObservableObject {
    @Published var profile: Profile = .init(name: "", introduce: "", link: "", image: "")
    @Published var feeds: [Feed] = []
    @Published var id: String = ""

    private let fetchProfileUseCase: FetchProfileUseCase
    private let fetchBookmarkFeedsUseCase: FetchFavoriteFeedsUseCase
    private let fetchWritingFeedsUseCase: FetchWritingFeedsUseCase

    init(
        fetchProfileUseCase: FetchProfileUseCase,
        fetchBookmarkFeedsUseCase: FetchFavoriteFeedsUseCase,
        fetchLikeFeedsUseCase: FetchWritingFeedsUseCase
    ) {
        self.fetchProfileUseCase = fetchProfileUseCase
        self.fetchBookmarkFeedsUseCase = fetchBookmarkFeedsUseCase
        self.fetchWritingFeedsUseCase = fetchLikeFeedsUseCase
    }

    private var bag = Set<AnyCancellable>()

    func fetchProfile() {
        self.fetchProfileUseCase.excute()
            .catch { error -> Empty<Profile, Never> in
                print(error)
                return .init()
            }
            .sink {
                self.profile = $0
            }
            .store(in: &bag)
    }

    func fetchBookmarkFeeds() {
        self.fetchBookmarkFeedsUseCase.excute()
            .catch { error -> Empty<[Feed], Never> in
                print(error)
                return .init()
            }
            .sink {
                self.feeds = $0
            }
            .store(in: &bag)
    }

    func fetchWritingFeeds() {
        self.fetchWritingFeedsUseCase.excute()
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
