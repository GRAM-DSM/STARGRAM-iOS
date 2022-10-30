import Foundation

import Combine
import Service
import UIKit

class PostProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var introduce: String = ""
    @Published var link: String = ""
    @Published var image: UIImage = .init()
    @Published var isSuccess: Bool = false

    private let writeProfileUseCase: WriteProfileUseCase

    init(writeProfileUseCase: WriteProfileUseCase) {
        self.writeProfileUseCase = writeProfileUseCase
    }

    private var bag = Set<AnyCancellable>()

    func postProfile() {
        self.writeProfileUseCase.excute(
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
