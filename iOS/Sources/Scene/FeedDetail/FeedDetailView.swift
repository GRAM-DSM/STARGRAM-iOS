import SwiftUI

struct FeedDetailView: View {
    @StateObject var viewModel: FeedDetailViewModel

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            ScrollView {
                HStack(spacing: 1) {
                    Text("Backend")
                        .font(.small100)
                        .padding(.leading, 16)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(.orange1)
                        .frame(width: 10, height: 10)
                    Spacer()
                }
                HStack {
                    Text(viewModel.feedDetail.title)
                        .font(.title500)
                        .padding(.top, 13)
                        .padding(.bottom, 11)
                        .padding(.leading, 16)
                    Spacer()
                }
                WriterView(
                    image: viewModel.feedDetail.profileImageUrl,
                    name: viewModel.feedDetail.name,
                    created: Date(),
                    isPressed: .constant(false)
                ).padding(.bottom, 19)
                ZStack(alignment: .bottom) {
                    FeedDetailTabView(images: viewModel.feedDetail.images)
                        .frame(height: 290)
                    HStack(
                        alignment: .center,
                        spacing: 0
                    ) {
                        Spacer()
                            .frame(width: 28)
                        Button {
                            viewModel.heartIsClick.toggle()
                        } label: {
                            Image(systemName: viewModel.heartIsClick ? "heart.fill" : "heart")
                                .foregroundColor(.orange1)
                        }
                        Spacer()
                            .frame(width: 7)
                        Text("\(viewModel.feedDetail.heartCount)")
                            .font(.button500)
                            .padding(.trailing, 18)
                        Button {
                            viewModel.heartIsClick.toggle()
                        } label: {
                            Image(systemName: "bubble.left")
                                .foregroundColor(.orange1)
                        }
                        Spacer()
                            .frame(width: 7)
                        Text("\(viewModel.feedDetail.commentCount)")
                            .font(.button500)
                        Spacer()
                    }
                    .padding(.bottom, 14)
                }
                TextEditor(text: $viewModel.feedDetail.content)
                    .disabled(true)
                    .font(.body400)
                    .padding(.horizontal, 16)
                FeedDetailTextField(
                    action: {
                        // action
                    }, text: $viewModel.comment
                ).ignoresSafeArea(.keyboard)
                Color.gray2
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: 1
                    )
                HStack {
                    Text("댓글 \(viewModel.feedDetail.comments.count)개")
                        .font(.body400)
                        .padding(.leading, 16)
                    Spacer()
                }
                ForEach(viewModel.feedDetail.comments, id: \.content) {
                    CommentListCell(comment: $0)
                }
            }
        }
        .onAppear {
            UITabBar.appearance().isHidden = true
        }
    }
}

struct FeedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FeedDetailViewModel()
        FeedDetailView(viewModel: viewModel)
    }
}
