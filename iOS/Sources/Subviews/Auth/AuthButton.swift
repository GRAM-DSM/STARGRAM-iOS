import SwiftUI

struct AuthButton: View {
    @Binding var isDisabled: Bool
    var text: String
    var action: () -> Void

    init(
        isDisabled: Binding<Bool> = .constant(false),
        text: String,
        action: @escaping () -> Void
    ) {
        self._isDisabled = isDisabled
        self.text = text
        self.action = action
    }
    var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(.white)
                .font(.button100)
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
