import SwiftUI

struct ImageView: View {
    var image: String
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image)) { image in
                image.resizable()
            } placeholder: {
                Color.gray1
            }
            .frame(height: 240)
            .padding(.horizontal, 16)
            Spacer()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: "")
    }
}
