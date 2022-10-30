import Foundation

import UIKit

extension String {
    func toImage() -> UIImage {
        var image = UIImage()
        let url = URL(string: self)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                image = UIImage(data: data ?? Data()) ?? UIImage()
            }
        }
        return image
    }
}
