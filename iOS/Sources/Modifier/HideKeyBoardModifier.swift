import SwiftUI

import UIKit

#if canImport(UIKit)
struct HideKeyBoardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil,
                    from: nil,
                    for: nil
                )
            }
    }
}
#endif

extension View {
    func hideKeyboard() -> some View {
        modifier(HideKeyBoardModifier())
    }
}
