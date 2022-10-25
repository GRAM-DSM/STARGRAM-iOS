import Foundation

import Combine
import Service
import UIKit

class EditProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var introduce: String = ""
    @Published var link: String = ""
    @Published var image: UIImage = UIImage()
    @Published var isSuccess: Bool = false

    private let fetchProfileUseCase: FetchProfileUseCase
    private let patchProfileUseCase: PatchProfileUseCase

    init(
        fetchProfileUseCase: FetchProfileUseCase,
        patchProfileUseCase: PatchProfileUseCase
    ) {
        self.fetchProfileUseCase = fetchProfileUseCase
        self.patchProfileUseCase = patchProfileUseCase
    }

    private var bag = Set<AnyCancellable>()

    func fetchProfile() {
        self.fetchProfileUseCase.excute()
            .catch { error -> Empty<Profile, Never> in
                print(error)
                return .init()
            }
            .sink {
                self.name = $0.name
                self.introduce = $0.introduce
                self.link = $0.link
                self.image = $0.image.toImage()
            }
            .store(in: &bag)
    }
    func editProfile() {
        self.patchProfileUseCase.excute(
            image: image.jpegData(compressionQuality: 1.0) ?? Data(),
            name: name,
            introduce: introduce,
            link: link
        )
        .catch { error -> Empty<Void, Never> in
            print(error)
            self.isSuccess = false
            return .init()
        }
        .sink {
            self.isSuccess = true
        }
        .store(in: &bag)
    }
}
