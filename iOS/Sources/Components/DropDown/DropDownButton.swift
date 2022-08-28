import SwiftUI

struct DropDownButton: View {
    @Binding var isPressend: Bool
    var major: String
    var body: some View {
        HStack(
            alignment: .center,
            spacing: 0
        ) {
            Image(systemName: isPressend ? "checkmark" : "")
                .resizable()
                .frame(width: 8, height: 10)
                .foregroundColor(.gray1)
                .padding(.horizontal, 7)
            Text(major)
                .font(.small100)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: 38
        )
    }
}

struct DropDownButton_Previews: PreviewProvider {
    static var previews: some View {
        DropDownButton(
            isPressend: .constant(true),
            major: "Backend"
        )
    }
}
