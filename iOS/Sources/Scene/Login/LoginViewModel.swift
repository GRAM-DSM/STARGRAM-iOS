import Foundation

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
}
