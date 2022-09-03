import SwiftUI

struct PhotoImageRow: View {
    var image: UIImage
    var action: () -> Void

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(uiImage: image)
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFill()
                .cornerRadius(8)
            Button(action: action) {
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .frame(
                        width: 14,
                        height: 14
                    )
                    .foregroundColor(.gray2)
            }
        }.frame(width: 66, height: 66)
    }
}

struct PhotoImageRow_Previews: PreviewProvider {
    static var previews: some View {
        PhotoImageRow(
            image: UIImage(),
            action: { }
        )
    }
}
