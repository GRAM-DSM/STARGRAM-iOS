import SwiftUI

struct SignUpTitle: View {
    var body: some View {
        HStack {
            Text("STARGRAM")
                .font(.title200)
                .foregroundColor(.orange2)
                .padding(.leading, 46)
            Spacer()
        }
    }
}

struct SignUpTitle_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTitle()
    }
}
