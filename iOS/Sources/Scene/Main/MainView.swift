import SwiftUI

struct MainView: View {
    @State private var index: Int = 0
    @State private var tabbarHidden: Bool = false
    private let tabImage = ["house", "magnifyingglass", "pencil", "person"]
    private let tabFillImage = ["house.circle.fill", "magnifyingglass.circle.fill",
                                "pencil.circle.fill", "person.circle.fill"]
    let homeView: HomeView
    let searchView: SearchView
    let writeView: WriteView
    let profileView: ProfileView

    var body: some View {
        ZStack {
            switch index {
            case 0:
                homeView
            case 1:
                searchView
            case 2:
                writeView
            default:
                profileView
            }
            if !tabbarHidden {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ForEach(0..<tabImage.count, id: \.self) { index in
                            Image(systemName: self.index == index ? tabFillImage[index] : tabImage[index])
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(self.index == index ? .orange1 : .gray)
                                .onTapGesture {
                                    self.index = index
                                }
                            Spacer()
                        }
                    }
                    .frame(height: 50)
                    .padding(.top, 5)
                    .padding(.bottom, 25)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray1, lineWidth: 0.2)
                    )
                }
                .ignoresSafeArea()
            }
        }
        .environment(\.tabbarHidden, $tabbarHidden)
        .ignoresSafeArea()
    }
}
