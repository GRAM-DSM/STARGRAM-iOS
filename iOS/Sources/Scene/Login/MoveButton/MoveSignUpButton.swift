import SwiftUI

struct MoveSignUpButton: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("계정이 없으신가요?")
            NavigationLink {
                SwiftUIView()
            } label: {
                Text("회원가입하기")
                    .font(.button300)
                    .foregroundColor(.orange1)
                    .underline(true, color: .orange1)
            }
        }
    }
}

struct MoveSignUpButton_Previews: PreviewProvider {
    static var previews: some View {
        MoveSignUpButton()
    }
}
