import SwiftUI

struct ButtonView: View {
    @Binding var isDisabled: Bool
    var action: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                AuthButton(
                    isDisabled: $isDisabled,
                    text: "로그인",
                    action: action
                ).padding(.horizontal, 46)
            }
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
            }.padding(.top, 14)
        }
    }
}

struct MoveSignUpButton_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            isDisabled: .constant(false),
            action: { })
    }
}
