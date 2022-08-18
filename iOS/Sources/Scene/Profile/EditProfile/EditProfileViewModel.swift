import Foundation

class EditProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var introduce: String = ""
    @Published var link: String = ""
}
