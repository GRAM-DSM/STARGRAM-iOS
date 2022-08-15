import SwiftUI

import Service

struct HomeListCell: View {
    var item: Feed
    var body: some View {
        HStack {
            
        }
    }
}

struct HomeListCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeListCell(
            item: Feed(
                id: "",
                name: "김기영",
                title: "울 영웅이 졸귀",
                created: Date(),
                heartCount: 9,
                commentCount: 2,
                imageUrl: URL(string: "http://newsimg.hankookilbo.com/2017/11/06/201711060912547465_1.jpg")!,
                heartStatus: false
            )
        )
    }
}
