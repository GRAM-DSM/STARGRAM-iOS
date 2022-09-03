import SwiftUI

struct Dropdown: View {
    @Binding var text: String
    var options: [String]
    var onOptionSelected: ((_ option: String) -> Void)?
    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: 0
            ) {
                ForEach(options, id: \.self) { data in
                    DropdownRow(
                        isSelceted: .constant(text == data),
                        option: data,
                        onOptionSelected: self.onOptionSelected
                    )
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .foregroundColor(.gray2)
        )
        .frame(
            minHeight: CGFloat(options.count) * 30,
            maxHeight: .infinity
        )
    }
}

struct Dropdown_Previews: PreviewProvider {
    static var previews: some View {
        Dropdown(text: .constant("dd"), options: ["Backend", "김기영"])
    }
}
