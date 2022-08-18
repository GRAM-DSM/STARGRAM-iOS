import SwiftUI

struct AuthButton: View {
    @Binding var isDisabled: Bool
    var text: String
    var action: () -> Void
    var font: Font

    init(
        isDisabled: Binding<Bool> = .constant(false),
        text: String,
        action: @escaping () -> Void,
        font: Font = .button100
    ) {
        self._isDisabled = isDisabled
        self.text = text
        self.action = action
        self.font = font
    }
    var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(.white)
                .font(font)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: 51)
                .background(isDisabled ? Color.gray2 : Color.orange1)
                .cornerRadius(8)
        }.disabled(isDisabled)
    }
}

struct AuthButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthButton(
            text: "로그인",
            action: { }
        )
    }
}
