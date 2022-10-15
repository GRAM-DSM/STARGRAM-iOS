import Foundation

import Combine

public class UploadImageUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(images: [Data]) -> AnyPublisher<FeedImage, STARGRAMError> {
        return repository.uploadImage(images: images)
    }
}
