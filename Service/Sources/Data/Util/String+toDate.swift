import Foundation

extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-ddThh:mm:ss"
        dateFormatter.locale = .init(identifier: "ko_KR")
        return dateFormatter.date(from: self) ?? Date()
    }
}
