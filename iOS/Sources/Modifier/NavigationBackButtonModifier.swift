import SwiftUI

struct NavigationBackButtonModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .foregroundColor(.orange1)
                            .frame(width: 10, height: 15)
                    }
                }
            }
            .navigationBarBackButtonHidden()
    }
}

extension View {
    func setNavigationBackButton() -> some View {
        modifier(NavigationBackButtonModifier())
    }
}
