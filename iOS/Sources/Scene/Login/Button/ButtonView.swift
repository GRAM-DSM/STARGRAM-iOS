import SwiftUI

struct ButtonView: View {
    @Binding var isDisabled: Bool
    @Binding var isActive: Bool
    let mainView: MainView
    let signupView: SignUpView
    var action: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            NavigationLink(
                destination: mainView,
                isActive: $isActive) {
                    AuthButton(
                        isDisabled: $isDisabled,
                        text: "로그인",
                        action: action
                    )
                }
                .disabled(isDisabled)
            HStack(alignment: .center) {
                Text("계정이 없으신가요?")
                NavigationLink {
                    signupView
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
