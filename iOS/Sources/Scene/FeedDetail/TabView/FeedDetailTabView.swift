import SwiftUI
import Service

struct FeedDetailTabView: View {
    var images: [String]

    init(images: [String]) {
        self.images = images
        UIPageControl.appearance().currentPageIndicatorTintColor = .init(named: "F29A26")
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.init(named: "F29A26")?.withAlphaComponent(0.2)
           }

    var body: some View {
        TabView {
            ForEach(images, id: \.self) {
                ImageView(image: $0)
            }
        }.tabViewStyle(PageTabViewStyle())
    }
}

struct FeedDetailTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeedDetailTabView(images: [])
    }
}
