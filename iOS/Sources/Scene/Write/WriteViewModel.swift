import Foundation

import UIKit

class WriteViewModel: ObservableObject {
    @Published var major: String = ""
    @Published var title: String = ""
    @Published var images: [UIImage] = []
    @Published var content: String = ""
}
