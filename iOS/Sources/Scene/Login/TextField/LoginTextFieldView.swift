import SwiftUI

struct LoginTextFieldView: View {
    @State private var entry: Bool = false
    @Binding var id: String
    @Binding var password: String

    var body: some View {
        VStack(spacing: 12) {
            LoginTextField(
                placeholder: "아이디",
                text: $id,
                entry: .constant(false)
            ).padding(.horizontal, 46)
            ZStack {
                LoginTextField(
                    placeholder: "비밀번호",
                    text: $password,
                    entry: $entry
                )
                HStack {
                    Spacer()
                    Button {
                        entry.toggle()
                    } label: {
                        if entry {
                            Image(systemName: "eye")
                        } else {
                            Image(systemName: "eye.slash")
                        }
                    }
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gray1)
                    Spacer()
                        .frame(width: 14)
                }
            }.padding(.horizontal, 46)
        }
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
