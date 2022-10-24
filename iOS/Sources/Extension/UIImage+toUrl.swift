import Foundation

import UIKit

extension String {
    func toImage() -> UIImage {
        let url = URL(string: self)!
        let data = try? Data(contentsOf: url)
        return UIImage(data: data ?? Data()) ?? UIImage()
    }
}
