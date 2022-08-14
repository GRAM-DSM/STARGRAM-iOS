import Foundation

class SignUpViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
    @Published var checkPassword: String = ""
    @Published var email: String = ""
    @Published var authCode: String = ""
}
