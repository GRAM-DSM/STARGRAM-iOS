import SwiftUI

import Service

struct HomeListCell: View {
    var item: Feed
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 13)
            HStack {
                AsyncImage(url: item.imageUrl)
                    .cornerRadius(8)
                    .frame(width: 50, height: 50)
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
            Color.gray2
                .frame(
                    maxWidth: .infinity,
                    maxHeight: 1
                )
            Spacer()
                .frame(height: 13)
        }
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
                imageUrl: URL(string: "https://www.remove.bg/ko")!,
                heartStatus: false
            )
        )
    }
}
