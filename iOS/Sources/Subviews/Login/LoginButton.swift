import SwiftUI

struct LoginButton: View {
    var action: () -> Void
    @Binding var isDisable: Bool
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                    .frame(width: 46)

                Text("로그인")
                    .font(.button100)
                    .foregroundColor(.white)
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           maxHeight: 51
                    )
                    .background(isDisable ? Color.gray2 : Color.orange1)
                    .cornerRadius(8)

                Spacer()
                    .frame(width: 46)
            }.disabled(isDisable)
        }
    }
}

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton(
            action: {print("로그인")},
            isDisable: .constant(true)
        )
    }
}
