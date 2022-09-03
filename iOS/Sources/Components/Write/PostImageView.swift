import SwiftUI

struct PostImageView: View {
    @Binding var images: [UIImage]
    @Binding var showImagePicker: Bool
    var body: some View {
        HStack(alignment: .center) {
            PhotoButton(
                count: .constant(images.count),
                isPressed: $showImagePicker
            )
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(images, id: \.self) { image in
                        PhotoImageRow(image: image) {
                            let index = images.firstIndex(of: image)
                            images.remove(at: index!)
                        }
                    }
                }
            }
        }
        .sheet(
            isPresented: $showImagePicker,
            content: {
                PhotoPicker(
                    isPresented: $showImagePicker,
                    images: $images,
                    selectionLimit: 4,
                    filter: .images
                )
            })
    }
}

struct PostImageView_Previews: PreviewProvider {
    static var previews: some View {
        PostImageView(
            images: .constant([]),
            showImagePicker: .constant(false)
        )
    }
}
