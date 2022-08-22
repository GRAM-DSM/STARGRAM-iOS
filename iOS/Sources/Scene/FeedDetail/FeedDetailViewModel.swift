import Foundation

import Service

class FeedDetailViewModel: ObservableObject {
    @Published var comment: String = ""
    @Published var heartIsClick: Bool = false
    @Published var feedDetail: FeedDetail = .init(
        id: "",
        profileImageUrl: "",
        name: "토끼",
        title: "토끼",
        content: "토끼는 사람이 아닙니다.",
        created: Date(),
        category: "iOS",
        heartCount: 3,
        commentCount: 3,
        favorite: false,
        images: [
            .init(older: 0, imageUrl: ""),
            .init(older: 1, imageUrl: "")
        ],
        comments: []
    )
}
