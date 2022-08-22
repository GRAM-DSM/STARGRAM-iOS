import SwiftUI

struct FeedDetailTextField: View {
    var action: () -> Void
    @Binding var text: String
    var body: some View {
        HStack {
            TextField("정보를 공유하세요!", text: $text)
                .font(.body600)
            Button(action: action) {
                Text("등록")
                    .font(.body600)
                    .foregroundColor(.gray1)
                    .padding()
            }
            .disabled(text.isEmpty)
        }
        .padding(.horizontal, 16)
        .border(
            width: 1,
            edges: [.top],
            color: .gray4
        )
    }
}

struct FeedDetailTextField_Previews: PreviewProvider {
    static var previews: some View {
        FeedDetailTextField(action: { }, text: .constant(""))
    }
}
