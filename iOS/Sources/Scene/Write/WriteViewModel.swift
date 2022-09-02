import Foundation

class WriteViewModel: ObservableObject {
    @Published var major: String = ""
    @Published var title: String = ""
    @Published var content: String = ""
}
