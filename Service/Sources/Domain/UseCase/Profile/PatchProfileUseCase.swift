import Foundation

import RxSwift

public class PatchProfileUseCase {

    private let repository: ProfileRepository

    init(repository: ProfileRepository) {
        self.repository = repository
    }

    public func excute(
        image: Data,
        name: String,
        introduce: String,
        link: String
    ) -> Completable {
        return repository.patchProfile(image, name, introduce, link)
    }
}
