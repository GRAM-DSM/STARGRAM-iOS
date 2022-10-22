import Foundation

import Combine
import Service

class HomeViewModel: ObservableObject {
    @Published var feeds: [Feed] = []
    @Published var isNotProfile: Bool = false

    private let fetchProfileUseCase: FetchProfileUseCase

    init(fetchProfileUseCase: FetchProfileUseCase) {
        self.fetchProfileUseCase = fetchProfileUseCase
    }

    private var bag = Set<AnyCancellable>()

    func checkUserHaveProfile() {
        self.fetchProfileUseCase.excute()
            .catch { error -> Empty<Profile, Never> in
                if error == .notFound {
                    self.isNotProfile = true
                }
                return .init()
            }
            .sink { _ in
                self.isNotProfile = false
            }
            .store(in: &bag)
    }
}
