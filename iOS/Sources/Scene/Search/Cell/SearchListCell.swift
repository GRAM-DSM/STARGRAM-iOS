import SwiftUI

struct SearchListCell: View {
    var search: String
    @Binding var searchText: String
    var body: some View {
            ZStack {
                HStack(spacing: 0) {
                    Text(search)
                        .font(.body200)
                        .foregroundColor(.gray1)
                    Spacer()
                }
                HStack(spacing: 0) {
                Text(searchText)
                    .font(.body200)
                    .foregroundColor(.orange1)
                    Spacer()
                }
            }
            .padding(.horizontal, 13)
    }
}

struct SearchListCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchListCell(
            search: "BackEnd",
            searchText: .constant("BackEnd")
        )
    }
}
