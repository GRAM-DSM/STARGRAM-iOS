import SwiftUI

struct FeedDetailView: View {
    @StateObject var viewModel: FeedDetailViewModel

    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            HStack(spacing: 1) {
                Text("Backend")
                    .font(.small100)
                    .padding(.leading, 16)
                Image(systemName: "chevron.right")
                    .resizable()
                    .foregroundColor(.orange1)
                    .frame(width: 10, height: 10)
            }
            Text("AOP가 뭔가요?")
                .font(.title500)
                .padding(.top, 13)
                .padding(.bottom, 11)
                .padding(.leading, 16)
            WriterView(
                image: viewModel.feedDetail.profileImageUrl,
                name: viewModel.feedDetail.name,
                created: Date(),
                isPressed: .constant(false)
            ).padding(.bottom, 19)
            ZStack {
                FeedDetailTabView(images: viewModel.feedDetail.images)
                    .frame(height: 290)
                HStack(alignment: .bottom) {
                    Button {
                        viewModel.heartIsClick.toggle()
                    } label: {
                        Image(systemName: viewModel.heartIsClick ? "heart.fill" : "heart")
                            .foregroundColor(.orange1)
                    }
                    Text("\(viewModel.feedDetail.heartCount)")
                        .font(.button500)
                    Button {
                        viewModel.heartIsClick.toggle()
                    } label: {
                        Image(systemName: "bubble.left")
                            .foregroundColor(.orange1)
                    }
                    Text("\(viewModel.feedDetail.heartCount)")
                        .font(.button500)
                }
            }
        }
    }
}

struct FeedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FeedDetailViewModel()
        FeedDetailView(viewModel: viewModel)
    }
}
