import Foundation

import Combine

public class DeleteProfileImageUseCase {

    private let repository: ProfileRepository

    init(repository: ProfileRepository) {
        self.repository = repository
    }

    public func excute() -> AnyPublisher<Void, STARGRAMError> {
        return repository.deleteProfileImage()
    }
}
