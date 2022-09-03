import SwiftUI

struct DropdownRow: View {
    @Binding var isSelceted: Bool
    var option: String
    var onOptionSelected: ((_ option: String) -> Void)?

    var body: some View {
        Button {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        } label: {
            HStack(alignment: .center) {
                Spacer()
                    .frame(width: 7)
                Image(systemName: isSelceted ? "checkmark" : "")
                    .resizable()
                    .frame(width: 8, height: 10)
                    .foregroundColor(.gray2)
                Spacer()
                    .frame(width: 7)
                Text(self.option)
                    .font(.small100)
                    .foregroundColor(.black)
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .border(
            width: option == "기타" ? 0 : 1,
            edges: [.bottom],
            color: .gray2
        )
        .background(Color.white)
    }
}

struct DropdownRow_Previews: PreviewProvider {
    static var previews: some View {
        DropdownRow(
            isSelceted: .constant(true),
            option: "야"
        )
    }
}
