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
                    Text(comment.created.toString())
                        .font(.small200)
                        .foregroundColor(.gray1)
                }
            }
            Color.gray2
                .frame(
                    maxWidth: .infinity,
                    maxHeight: 1
                )
        }.padding(.horizontal, 16)
    }
}

struct CommentListCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentListCell(comment: .init(
            commentId: 1,
            profileImageUrl: "",
            name: "김기영",
            content: "안녕하세요.",
            created: Date()
        ))
    }
}
