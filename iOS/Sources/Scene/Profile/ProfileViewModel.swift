import Foundation
import Service

class ProfileViewModel: ObservableObject {
    @Published var profile: Profile = .init(name: "김기영", introduce: "대덕소프트웨어마이스터고등학교", link: "", image: "")
    var feeds: [Feed] = []
}
