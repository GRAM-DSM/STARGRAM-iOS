import SwiftUI

struct SearchListCell: View {
    var search: String
    @Binding var searchText: String
    var body: some View {
            ZStack {
                HStack {
                    Text(search)
                        .font(.body200)
                        .foregroundColor(.gray1)
                    Spacer()
                }
                HStack {
                Text(searchText)
                    .font(.body200)
                    .foregroundColor(.orange1)
                    Spacer()
                }
            }
            .frame(height: 45)
            .padding(.horizontal, 33)
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
