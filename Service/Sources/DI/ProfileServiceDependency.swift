import Foundation

public struct ProfileServiceDependency {
    public let deleteProfileImageUseCase: DeleteProfileImageUseCase
    public let fetchFavoriteFeedsUseCase: FetchFavoriteFeedsUseCase
    public let fetchProfileUseCase: FetchProfileUseCase
    public let fetchWritingFeedsUseCase: FetchWritingFeedsUseCase
    public let patchProfileUseCase: PatchProfileUseCase
    public let writeProfileUseCase: WriteProfileUseCase
}

public extension ProfileServiceDependency {
    static func resolve() -> ProfileServiceDependency {

        let repository: ProfileRepository = ProfileRepositoryImpl()

        let deleteProfileImageUseCase = DeleteProfileImageUseCase(
            repository: repository
        )
        let fetchFavoriteFeedsUseCase = FetchFavoriteFeedsUseCase(
            repository: repository
        )
        let fetchProfileUseCase = FetchProfileUseCase(
            repository: repository
        )
        let fetchWritingFeedsUseCase = FetchWritingFeedsUseCase(
            repository: repository
        )
        let patchProfileUseCase = PatchProfileUseCase(
            repository: repository
        )
        let writeProfileUseCase = WriteProfileUseCase(
            repository: repository
        )

        return ProfileServiceDependency(
            deleteProfileImageUseCase: deleteProfileImageUseCase,
            fetchFavoriteFeedsUseCase: fetchFavoriteFeedsUseCase,
            fetchProfileUseCase: fetchProfileUseCase,
            fetchWritingFeedsUseCase: fetchWritingFeedsUseCase,
            patchProfileUseCase: patchProfileUseCase,
            writeProfileUseCase: writeProfileUseCase
        )
    }
}
