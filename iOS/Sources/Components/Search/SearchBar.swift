import SwiftUI

struct SearchBar: View {
    var action: () -> Void
    @Binding var text: String

    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                TextField(
                    "",
                    text: $text
                )
                .font(.small100)
                .padding(.leading, 18)
                .foregroundColor(.white)
                if text.isEmpty {
                    Text("STARGRAM 검색어")
                        .font(.small100)
                        .foregroundColor(.white)
                        .padding(.leading, 18)
                }
            }
            Button(action: action) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(
                        width: 15,
                        height: 15
                    )
                    .foregroundColor(.white)
                    .padding(.trailing, 18)
            }
        }
        .frame(width: 320, height: 30)
        .background(Color.orange2)
        .cornerRadius(20)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(
            action: { },
            text: .constant("")
        )
    }
}
