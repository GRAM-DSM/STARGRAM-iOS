import Foundation

import UIKit

class EditProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var introduce: String = ""
    @Published var link: String = ""
    @Published var image: UIImage = UIImage()
}
