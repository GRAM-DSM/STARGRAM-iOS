import Foundation

import RxSwift

public class FetchProfileUseCase {

    private let repository: ProfileRepository

    init(repository: ProfileRepository) {
        self.repository = repository
    }

    public func excute() -> Single<Profile> {
        return repository.fetchProfile()
    }
}
