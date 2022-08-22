import SwiftUI

struct WriterView: View {
    var image: String
    var name: String
    var created: Date
    @Binding var isPressed: Bool
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
                .frame(width: 16)
            AsyncImage(
                url: URL(string: image)) { image in
                    image
                        .scaledToFill()
                } placeholder: {
                    Color.gray1
                }
                .frame(width: 35, height: 35)
                .background(Color.gray1)
                .clipShape(Circle())
            Spacer()
                .frame(width: 9)
            VStack(
                alignment: .leading,
                spacing: 0
            ) {
                Text("토끼")
                    .font(.body400)
                Text("22.07.13 10:17")
                    .font(.small200)
                    .foregroundColor(.gray1)
            }
            Spacer()
            Button {
                isPressed.toggle()
            } label: {
                Image(systemName: isPressed ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 27.6, height: 26.25)
                    .foregroundColor(.orange1)
            }
            Spacer()
                .frame(width: 16)
        }
    }
}

struct WriterView_Previews: PreviewProvider {
    static var previews: some View {
        WriterView(
            image: "",
            name: "토끼",
            created: Date(),
            isPressed: .constant(false)
        )
    }
}
