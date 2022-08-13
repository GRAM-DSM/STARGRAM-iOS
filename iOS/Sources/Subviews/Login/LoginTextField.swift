import SwiftUI

struct LoginTextField: View {
    let placeholder: String
    @Binding var text: String
    @Binding var entry: Bool

    var body: some View {
        HStack {
            if entry {
                SecureField(
                    placeholder,
                    text: $text
                )
                .padding(.horizontal, 15)
                .font(.body200)
            } else {
                TextField(
                    placeholder,
                    text: $text
                )
                .padding(.horizontal, 15)
                .font(.body200)
            }
        }
        .frame(height: 51)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundColor(.gray1)
        )
    }
}

struct LoginTextField_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextField(
            placeholder: "로그인",
            text: .constant(""),
            entry: .constant(false)
        )
    }
}
