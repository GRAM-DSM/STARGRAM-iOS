import Foundation

import RxSwift

public class UploadImageUseCase {

    private let repository: FeedRepository

    init(repository: FeedRepository) {
        self.repository = repository
    }

    public func excute(images: [Data]) -> Single<[FeedImage]> {
        return repository.uploadImage(images)
    }
}
