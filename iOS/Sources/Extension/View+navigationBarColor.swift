import SwiftUI

extension View {
  func navigationBarColor(_ backgroundColor: Color, textColor: Color) -> some View {
    self.modifier(NavigationBarModifier(
        backgroundColor: UIColor(backgroundColor),
        textColor: UIColor(textColor)
    ))
  }
}
