import SwiftUI

struct HomeTitle: View {
    var body: some View {
        HStack {
            Text("STARGRAM")
                .font(.title300)
                .foregroundColor(.orange1)
                .padding(.leading, 16)
            Spacer()
        }
    }
}

struct HomeTitle_Previews: PreviewProvider {
    static var previews: some View {
        HomeTitle()
    }
}
