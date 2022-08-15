import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 3) {
            HomeTitle()
            Image("BackImage")
                .padding(.horizontal, 16)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
