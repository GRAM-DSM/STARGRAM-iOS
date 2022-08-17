import SwiftUI

struct ProfileButton: View {
    var action: () -> Void
    var title: String
    @Binding var isClick: Bool

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Text(title)
                    .font(.button200)
                    .foregroundColor(isClick ? .orange1 : .gray2)
                if isClick {
                    Color.orange1
                        .frame(width: 100, height: 4)
                        .cornerRadius(2)
                }
            }.frame(width: 100)
        }
    }
}

struct ProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButton(
            action: { },
            title: "작성글",
            isClick: .constant(true)
        )
    }
}
