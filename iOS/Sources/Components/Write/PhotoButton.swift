import SwiftUI

struct PhotoButton: View {
    @Binding var count: Int
    @Binding var isPressed: Bool

    var body: some View {
        Button {
            isPressed.toggle()
        } label: {
            VStack(spacing: 3) {
                Image(systemName: "camera")
                    .resizable()
                    .frame(
                        width: 28,
                        height: 24
                    )
                    .foregroundColor(.orange1)
                Text("\(count) / 4")
                    .font(.small200)
                    .foregroundColor(.gray1)
            }
        }
        .frame(width: 60, height: 60)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundColor(.gray1)
        )
        .padding(.vertical, 10)
    }
}

struct PhotoButton_Previews: PreviewProvider {
    static var previews: some View {
        PhotoButton(
            count: .constant(3),
            isPressed: .constant(false)
        )
    }
}
