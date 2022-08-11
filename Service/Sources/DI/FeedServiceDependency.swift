import Foundation

public struct FeedServiceDependency {
    public let createCommentUseCase: CreateCommentUseCase
    public let createFeedUseCase: CreateFeedUseCase
    public let deleteCommentUseCase: DeleteCommentUseCase
    public let deleteFeedUseCase: DeleteFeedUseCase
    public let favoriteUseCase: FavoriteUseCase
    public let fetchFeedDetailUseCase: FetchFeedDetailUseCase
    public let fetchFeedsUseCase: FetchFeedsUseCase
    public let likeUseCase: LikeUseCase
    public let patchCommentUseCase: PatchCommentUseCase
    public let patchFeedUseCase: PatchFeedUseCase
    public let unFavoriteUseCase: UnFavoriteUseCase
    public let unLikeUseCase: UnLikeUseCase
    public let uploadImageUseCase: UploadImageUseCase
}

public extension FeedServiceDependency {
    // swiftlint:disable function_body_length
    static func resolve() -> FeedServiceDependency {

        let repository: FeedRepository = FeedRepositoryImpl()

        let createCommentUseCase = CreateCommentUseCase(
            repository: repository
        )
        let createFeedUseCase = CreateFeedUseCase(
            repository: repository
        )
        let deleteCommentUseCase = DeleteCommentUseCase(
            repository: repository
        )
        let deleteFeedUseCase = DeleteFeedUseCase(
            repository: repository
        )
        let favoriteUseCase = FavoriteUseCase(
            repository: repository
        )
        let fetchFeedDetailUseCase = FetchFeedDetailUseCase(
            repository: repository
        )
        let fetchFeedsUseCase = FetchFeedsUseCase(
            repository: repository
        )
        let likeUseCase = LikeUseCase(
            repository: repository
        )
        let patchCommentUseCase = PatchCommentUseCase(
            repository: repository
        )
        let patchFeedUseCase = PatchFeedUseCase(
            repository: repository
        )
        let unFavoriteUseCase = UnFavoriteUseCase(
            repository: repository
        )
        let unLikeUseCase = UnLikeUseCase(
            repository: repository
        )
        let uploadImageUseCase = UploadImageUseCase(
            repository: repository
        )

        return FeedServiceDependency(
            createCommentUseCase: createCommentUseCase,
            createFeedUseCase: createFeedUseCase,
            deleteCommentUseCase: deleteCommentUseCase,
            deleteFeedUseCase: deleteFeedUseCase,
            favoriteUseCase: favoriteUseCase,
            fetchFeedDetailUseCase: fetchFeedDetailUseCase,
            fetchFeedsUseCase: fetchFeedsUseCase,
            likeUseCase: likeUseCase,
            patchCommentUseCase: patchCommentUseCase,
            patchFeedUseCase: patchFeedUseCase,
            unFavoriteUseCase: unFavoriteUseCase,
            unLikeUseCase: unLikeUseCase,
            uploadImageUseCase: uploadImageUseCase
        )
    }
}
