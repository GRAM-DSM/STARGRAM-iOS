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
            .sink { profile in
                DispatchQueue.global().async {
                    let url = URL(string: profile.image)
                    if let data = try? Data(contentsOf: url!) {
                        DispatchQueue.main.async {
                            self.image = UIImage(data: data) ?? UIImage()
                        }
                    }
                }
                self.name = profile.name
                self.introduce = profile.introduce
                self.link = profile.link
                self.isSuccess = false
            }
            .store(in: &bag)
    }
    func editProfile() {
        self.patchProfileUseCase.excute(
            image: image.jpegData(compressionQuality: 0.0) ?? Data(),
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
