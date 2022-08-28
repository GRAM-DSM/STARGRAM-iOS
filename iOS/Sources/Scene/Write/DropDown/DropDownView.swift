import SwiftUI

struct DropDownView: View {
    private let majorList: [String] = [
        "Backend", "iOS", "Frontend",
        "Android", "Embedded", "Game",
        "Security", "Design", "AI",
        "RN", "Flutter", "기타"
    ]
    @State var major: String = ""
    var body: some View {
        VStack(spacing: 0) {
            ForEach(majorList, id: \.self) { maj in
                Button {
                    self.major = maj
                } label: {
                    DropDownButton(
                        isPressend: .constant(false),
                        major: maj
                    )
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .foregroundColor(.gray2)
        )
    }
}

struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownView()
    }
}
