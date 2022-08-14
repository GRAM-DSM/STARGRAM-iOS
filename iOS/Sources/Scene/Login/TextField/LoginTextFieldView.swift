import SwiftUI

struct LoginTextFieldView: View {
    @State private var entry: Bool = false
    @Binding var id: String
    @Binding var password: String

    var body: some View {
        VStack(spacing: 0) {
            AuthTextField(
                placeholder: "아이디",
                text: $id
            )
            AuthTextField(
                placeholder: "비밀번호",
                isSecret: true,
                text: $password
            )
        }.padding(.horizontal, 46)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextFieldView(
            id: .constant(""),
            password: .constant("")
        )
    }
}
