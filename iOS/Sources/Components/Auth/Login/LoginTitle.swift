import SwiftUI

struct LoginTitle: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text("안녕하세요")
                    .foregroundColor(Color.orange2)
                    .font(.title100)
                HStack(spacing: 3) {
                    Text("STARGRAM")
                        .foregroundColor(Color.orange2)
                        .font(.title200)
                    Text("입니다")
                        .foregroundColor(Color.orange2)
                        .font(.title100)
                }
            }
            Spacer()
        }
    }
}

struct LoginTitle_Previews: PreviewProvider {
    static var previews: some View {
        LoginTitle()
    }
}
