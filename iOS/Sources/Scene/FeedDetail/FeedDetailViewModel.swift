import Foundation

import Combine
import Service

class FeedDetailViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var comment: String = ""
    @Published var heartIsClick: Bool = false
    @Published var feedDetail: FeedDetail = .init(
        id: "",
        profileImageUrl: "",
        name: "",
        title: "",
        content: "",
        created: Date(),
        category: "",
        heartCount: 0,
        commentCount: 0,
        favorite: false,
        images: [""],
        comments: []
    )

    private let fetchFeedDetailUseCase: FetchFeedDetailUseCase

    init(fetchFeedDetailUseCase: FetchFeedDetailUseCase) {
        self.fetchFeedDetailUseCase = fetchFeedDetailUseCase
    }

    private var bag = Set<AnyCancellable>()

    func fetchFeedDetail() {
        self.fetchFeedDetailUseCase.excute(feedId: id)
            .catch { error -> Empty<FeedDetail, Never> in
                print(error)
                return .init()
            }
            .sink { [weak self] feedDetail in
                self?.feedDetail = feedDetail
            }
            .store(in: &bag)
    }

    func like() {
    }
}
