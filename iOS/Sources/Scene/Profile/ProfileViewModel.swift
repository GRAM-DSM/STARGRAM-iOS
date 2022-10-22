import Foundation

import Service
import Combine

class ProfileViewModel: ObservableObject {
    @Published var profile: Profile = .init(name: "", introduce: "", link: "", image: "")
    @Published var feeds: [Feed] = []

    private let fetchProfileUseCase: FetchProfileUseCase

    init(fetchProfileUseCase: FetchProfileUseCase) {
        self.fetchProfileUseCase = fetchProfileUseCase
    }

    private var bag = Set<AnyCancellable>()

    func fetchProfile() {
        self.fetchProfileUseCase.excute()
            .catch { error -> Empty<Profile, Never> in
                print(error)
                return .init()
            }
            .sink {
                self.profile = $0
            }
            .store(in: &bag)
    }
}
