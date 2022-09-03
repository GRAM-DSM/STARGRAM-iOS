import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {

    typealias UIViewControllerType = PHPickerViewController

    @Binding var isPresented: Bool
    @Binding var images: [UIImage]
    var selectionLimit: Int
    var filter: PHPickerFilter?
    var itemProviders: [NSItemProvider] = []

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = self.selectionLimit
        configuration.filter = self.filter
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        return PhotoPicker.Coordinator(parent: self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate, UINavigationControllerDelegate {

        var parent: PhotoPicker

        init(parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.isPresented = false

            if !results.isEmpty {
                parent.itemProviders = []
                parent.images = []
            }

            parent.itemProviders = results.map(\.itemProvider)
            loadImage()
        }

        private func loadImage() {
            for itemProvider in parent.itemProviders where itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    if let image = image as? UIImage {
                        self.parent.images.append(image)
                    } else {
                        print("Could not load image", error?.localizedDescription ?? "")
                    }
                }
            }
        }
    }
}
