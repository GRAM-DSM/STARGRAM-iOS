import SwiftUI

struct AuthTextField: View {
    let title: String
    let placeholder: String
    let isSecret: Bool
    @State private var isShow: Bool = false
    @Binding var text: String
    @Binding var message: String
    @Binding var messageColor: Color

    init(
        title: String = "",
        placeholder: String = "",
        isSecret: Bool = false,
        text: Binding<String>,
        message: Binding<String> = .constant(""),
        messageColor: Binding<Color> = .constant(.red)
    ) {
        self.title = title
        self.placeholder = placeholder
        self.isSecret = isSecret
        self._text = text
        self._message = message
        self._messageColor = messageColor
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if !title.isEmpty {
                Text(title)
                    .font(.small100)
                    .padding(.bottom, 3)
            }
            ZStack(alignment: .trailing) {
                HStack {
                    Spacer()
                        .frame(width: 15)
                    if !isShow && isSecret {
                        SecureField(
                            placeholder,
                            text: $text
                        )
                        .font(.body200)
                    } else {
                        TextField(
                            placeholder,
                            text: $text
                        )
                        .font(.body200)
                    }
                }
                .frame(height: 51)
                .textInputAutocapitalization(.never)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.gray1)
                )
                if isSecret {
                    HStack {
                        Button {
                            self.isShow.toggle()
                        } label: {
                            Image(systemName: isShow ? "eye.slash" : "eye")
                        }
                        .frame(width: 24, height: 24)
                        .tint(.gray1)
                        .padding(.trailing, 15)
                    }
                }
            }
            Text(message)
                .foregroundColor(messageColor)
                .font(.small200)
                .padding(.top, 1)
        }
    }
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthTextField(
            title: "아이디",
            isSecret: true,
            text: .constant(""),
            message: .constant("에러가 발생하였습니다.")
        )
    }
}
