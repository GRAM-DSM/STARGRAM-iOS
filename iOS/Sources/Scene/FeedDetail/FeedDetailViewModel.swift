import Foundation

import Combine
import Service

class FeedDetailViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var comment: String = ""
    @Published var heartCount: Int = 0
    @Published var feedDetail: FeedDetail = .init(
        id: "",
        profileImageUrl: "",
        name: "",
        title: "",
        content: "",
        created: Date(),
        category: "",
        heartCount: 0,
        heartState: false,
        commentCount: 0,
        favorite: false,
        images: [""],
        comments: []
    )

    private let fetchFeedDetailUseCase: FetchFeedDetailUseCase
    private let likeUseCase: LikeUseCase
    private let unLikeUseCase: UnLikeUseCase
    private let favoriteUseCase: FavoriteUseCase
    private let unFavoriteUseCase: UnFavoriteUseCase

    init(
        fetchFeedDetailUseCase: FetchFeedDetailUseCase,
        likeUseCase: LikeUseCase,
        unLikeUseCase: UnLikeUseCase,
        favoriteUseCase: FavoriteUseCase,
        unFavoriteUseCase: UnFavoriteUseCase
    ) {
        self.fetchFeedDetailUseCase = fetchFeedDetailUseCase
        self.likeUseCase = likeUseCase
        self.unLikeUseCase = unLikeUseCase
        self.favoriteUseCase = favoriteUseCase
        self.unFavoriteUseCase = unFavoriteUseCase
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
                self?.heartCount = 0
            }
            .store(in: &bag)
    }

    func like() {
        if feedDetail.heartState {
            self.unLikeUseCase.excute(feedId: id)
                .catch { error -> Empty<Void, Never> in
                    print(error)
                    return .init()
                }
                .sink { [weak self] in
                    self?.feedDetail.heartState.toggle()
                    self?.feedDetail.heartCount -= 1
                }
                .store(in: &bag)
        } else {
            self.likeUseCase.excute(feedId: id)
                .catch { error -> Empty<Void, Never> in
                    print(error)
                    return .init()
                }
                .sink { [weak self] in
                    self?.feedDetail.heartState.toggle()
                    self?.feedDetail.heartCount += 1
                }
                .store(in: &bag)
        }
    }

    func bookmark() {
        if feedDetail.favorite {
            self.unFavoriteUseCase.excute(feedId: id)
                .catch { error -> Empty<Void, Never> in
                    print(error)
                    return .init()
                }
                .sink { [weak self] in
                    self?.feedDetail.favorite.toggle()
                }
                .store(in: &bag)
        } else {
            self.favoriteUseCase.excute(feedId: id)
                .catch { error -> Empty<Void, Never> in
                    print(error)
                    return .init()
                }
                .sink { [weak self] in
                    self?.feedDetail.favorite.toggle()
                }
                .store(in: &bag)
        }
    }
}
