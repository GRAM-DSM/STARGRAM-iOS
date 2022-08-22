import SwiftUI

struct SignUpTextField: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    @Binding var message: String
    @Binding var messageColor: Color
    var buttonTitle: String
    var action: () -> Void
    var buttonWidth: CGFloat

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            AuthTextField(
                title: title,
                placeholder: placeholder,
                text: $text,
                message: $message,
                messageColor: $messageColor
            )
            .padding(.trailing, 6)
            AuthButton(
                isDisabled: .constant(text.isEmpty),
                text: buttonTitle,
                action: action,
                font: .button400
            ).frame(width: buttonWidth)
                .padding(.top, 4)
        }.padding(.horizontal, 46)
    }
}

struct SignUpTextField_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTextField(
            title: "ID",
            placeholder: "아이디",
            text: .constant(""),
            message: .constant("에러입니다."),
            messageColor: .constant(.red),
            buttonTitle: "중복확인",
            action: { },
            buttonWidth: 70
        )
    }
}
