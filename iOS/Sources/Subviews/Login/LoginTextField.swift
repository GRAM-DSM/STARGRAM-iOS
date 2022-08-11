import SwiftUI

struct LoginTextField: View {
    let placeholder: String
    @Binding var text: String
    var body: some View {
        TextField(placeholder, text: $text)
    }
}

struct LoginTextField_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextField(
            placeholder: "로그인",
            text: .constant("")
        )
    }
}
