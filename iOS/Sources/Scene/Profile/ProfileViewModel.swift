import Foundation

import Service
import Combine

class ProfileViewModel: ObservableObject {
    @Published var profile: Profile = .init(name: "", introduce: "", link: "", image: "")
    @Published var feeds: [Feed] = []
    @Published var fetchProfileIsFail: Bool = false

    private let fetchProfileUseCase: FetchProfileUseCase

    init(fetchProfileUseCase: FetchProfileUseCase) {
        self.fetchProfileUseCase = fetchProfileUseCase
    }

    private var bag = Set<AnyCancellable>()

    func fetchProfile() {
        self.fetchProfileUseCase.excute()
            .catch { error -> Empty<Profile, Never> in
                if error == .notFound {
                    self.fetchProfileIsFail = true
                }
                return .init()
            }
            .sink {
                self.profile = $0
            }
            .store(in: &bag)
    }
}
