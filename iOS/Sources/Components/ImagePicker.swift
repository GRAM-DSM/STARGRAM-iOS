import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage

    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator

    var sourceType: UIImagePickerController.SourceType = .camera

    func makeUIViewController(
        context: UIViewControllerRepresentableContext<ImagePicker>
    ) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(image: $image)
    }

    func updateUIViewController(
        _ uiViewController: UIImagePickerController,
        context: Context
    ) { }
}

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var image: UIImage

    init(image: Binding<UIImage>) {
        self._image = image
    }

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = uiImage
        }
    }
}
