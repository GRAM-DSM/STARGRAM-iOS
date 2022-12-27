import SwiftUI

import Service

struct CommentListCell: View {
    var comment: Comment
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 2
        ) {
            HStack(
                alignment: .top,
                spacing: 10
            ) {
                AsyncImage(
                    url: URL(string: comment.profileImageUrl)) { image in
                        image
                            .scaledToFill()
                    } placeholder: {
                        Color.gray1
                    }
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                VStack(
                    alignment: .leading,
                    spacing: 2
                ) {
                    Text(comment.name)
                        .font(.body700)
                    Text(comment.content)
                        .font(.small100)
                    Text(comment.created.toString(format: "yy.MM.dd hh:mm"))
                        .font(.small200)
                        .foregroundColor(.gray1)
                }
            }
            Color.gray2
                .frame(
                    maxWidth: .infinity,
                    maxHeight: 1
                )
                .padding(.top, 5)
        }.padding(.horizontal, 16)
    }
}
