import Foundation

import Combine

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
    ) -> AnyPublisher<Void, STARGRAMError> {
        return repository.patchProfile(
            image: image,
            name: name,
            introduce: introduce,
            link: link
        )
    }
}
