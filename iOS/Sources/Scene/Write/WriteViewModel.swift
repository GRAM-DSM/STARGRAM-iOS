import Foundation

import Combine
import Service
import UIKit

class WriteViewModel: ObservableObject {
    @Published var major: String = ""
    @Published var title: String = ""
    @Published var imageUrl: [String] = []
    @Published var images: [UIImage] = []
    @Published var content: String = ""
    @Published var isDisabled: Bool = true
    @Published var isSuccess: Bool = false

    private let uploadImageUseCase: UploadImageUseCase
    private let createFeedUseCase: CreateFeedUseCase

    init(
        uploadImageUseCase: UploadImageUseCase,
        createFeedUseCase: CreateFeedUseCase
    ) {
        self.uploadImageUseCase = uploadImageUseCase
        self.createFeedUseCase = createFeedUseCase
    }

    private var bag = Set<AnyCancellable>()

    func createFeed() {
        self.createFeedUseCase.excute(
            title: title,
            content: content,
            category: major,
            url: imageUrl
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

    func setImage() {
        if images != [] {
            self.uploadImageUseCase.excute(
                images: self.images.map { $0.jpegData(compressionQuality: 0.5) ?? Data() }
            )
            .catch { error -> Empty<FeedImage, Never> in
                print(error)
                return .init()
            }
            .sink {
                self.imageUrl = $0.urls
            }
            .store(in: &bag)
        } else {
            imageUrl = []
        }
    }

    func checkIsDisabled() {
        self.isDisabled = title.isEmpty || major.isEmpty || content.isEmpty || imageUrl == []
    }

    func removeAll() {
        title = ""
        major = ""
        imageUrl = []
        images = []
        content = ""
        isSuccess = false
    }
}
