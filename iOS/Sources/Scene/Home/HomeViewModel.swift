import Foundation

import Service

class HomeViewModel: ObservableObject {
    @Published var feeds: [Feed] = []
}
