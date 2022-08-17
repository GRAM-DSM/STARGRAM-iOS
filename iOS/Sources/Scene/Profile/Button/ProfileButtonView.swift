import SwiftUI

struct ProfileButtonView: View {
    var action1: Void
    var action2: Void
    @State var isClick1: Bool = true
    @State var isClick2: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.gray2
                .frame(
                    maxWidth: .infinity,
                    maxHeight: 2
                ).padding(.bottom, 1.5)
            HStack(
                alignment: .top,
                spacing: 80
            ) {
                ProfileButton(
                    action: {
                        action1
                        isClick1.toggle()
                        isClick2.toggle()
                    },
                    title: "작성글",
                    isClick: $isClick1
                )
                ProfileButton(
                    action: {
                        action2
                        isClick1.toggle()
                        isClick2.toggle()
                    },
                    title: "즐겨찾기",
                    isClick: $isClick2
                )
            }
        }
    }
}

struct ProfileButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButtonView(
            action1: print(""),
            action2: print("")
        )
    }
}
