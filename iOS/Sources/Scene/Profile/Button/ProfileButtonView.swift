import SwiftUI

struct ProfileButtonView: View {
    var action1: () -> Void
    var action2: () -> Void
    @Binding var isClick1: Bool
    @Binding var isClick2: Bool

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
                    action: action1,
                    title: "작성글",
                    isClick: $isClick1
                )
                ProfileButton(
                    action: action2,
                    title: "즐겨찾기",
                    isClick: $isClick2
                )
            }
        }
    }
}
