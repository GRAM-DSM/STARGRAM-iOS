import Foundation

import Service

class FeedDetailViewModel: ObservableObject {
    @Published var heartIsClick: Bool = false
    @Published var feedDetail: FeedDetail = .init(
        id: "",
        profileImageUrl: "",
        name: "",
        title: "",
        content: "",
        created: Date(),
        category: "iOS",
        heartCount: 3,
        commentCount: 3,
        favorite: false,
        images: [],
        comments: []
    )
}
