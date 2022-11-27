import SwiftUI

import Service

struct HomeListCell: View {
    var item: Feed
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                AsyncImage(
                    url: URL(string: item.imageUrl)
                ) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray1
                }
                .frame(width: 50, height: 50)
                .cornerRadius(8)
                VStack(
                    alignment: .leading,
                    spacing: 0
                ) {
                    Text(item.title)
                        .font(.button300)
                    HStack {
                        Text(item.name)
                            .font(.small100)
                        Text(item.created.toString())
                            .font(.small100)
                    }
                }
                Spacer()
                VStack {
                    Button {
                        print("!")
                    } label: {
                        Image(systemName: item.heartStatus ? "heart.fill" : "heart")
                            .foregroundColor(.orange1)
                    }
                    Text("\(item.heartCount)")
                        .font(.small200)
                }
                VStack {
                    Button {
                        print("comment")
                    } label: {
                        Image(systemName: "bubble.left")
                            .foregroundColor(.orange1)
                    }
                    Text("\(item.commentCount)")
                        .font(.small200)
                }
            }
        }
        .padding(.vertical, 13)
        .border(width: 1, edges: [.bottom], color: .gray2)
    }
}

struct HomeListCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeListCell(
            item: Feed(
                id: "",
                name: "김기영",
                title: "울 영웅이 졸귀",
                created: Date(),
                heartCount: 9,
                commentCount: 2,
                imageUrl: "https://www.remove.bg/ko",
                heartStatus: false
            )
        )
    }
}
