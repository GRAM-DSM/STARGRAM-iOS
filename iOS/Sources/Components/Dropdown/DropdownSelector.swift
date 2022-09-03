import SwiftUI

struct DropdownSelector: View {
    @State private var shouldShowDropdown: Bool = false
    @Binding var selectedOption: String
    var placeholder: String
    var onOptionSelected: ((_ option: String) -> Void)?

    var body: some View {
        Button {
            self.shouldShowDropdown.toggle()
        } label: {
            HStack {
                Text(selectedOption.isEmpty ? placeholder : selectedOption)
                    .font(.small100)
                    .foregroundColor(selectedOption.isEmpty ? .gray1 : .black)

                Spacer()

                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.down.fill" : "arrowtriangle.up.fill")
                    .resizable()
                    .frame(width: 7.5, height: 6.75)
                    .foregroundColor(.orange1)
                    .padding(.trailing, 4)
            }
        }
        .padding(.vertical, 6)
        .border(
            width: 1,
            edges: [.bottom],
            color: .gray2
        )
        .padding(.horizontal, 33)
        .overlay(
            VStack {
                Spacer()
                    .frame(height: 30)
                if self.shouldShowDropdown {
                    Dropdown(
                        text: $selectedOption,
                        options: [
                            "Backend",
                            "iOS",
                            "Frontend",
                            "Android",
                            "Embedded",
                            "Game",
                            "Security",
                            "Design",
                            "AI",
                            "RN",
                            "Flutter",
                            "기타"
                        ]) { option in
                            self.shouldShowDropdown = false
                            self.selectedOption = option
                            self.onOptionSelected?(option)
                        }
                        .padding(.horizontal, 33)
                }
            }, alignment: .topLeading
        )
    }
}

struct DropdownSelector_Previews: PreviewProvider {
    static var previews: some View {
        DropdownSelector(
            selectedOption: .constant(""),
            placeholder: "정복입력"
        )
    }
}
