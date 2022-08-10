import Foundation

import RxSwift

public class DeleteProfileImageUseCase {

    private let repository: ProfileRepository

    init(repository: ProfileRepository) {
        self.repository = repository
    }

    public func excute() -> Completable {
        return repository.deleteProfileImage()
    }
}
