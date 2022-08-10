import Foundation

public struct Feed: Equatable {
    public let id: String
    public let name: String
    public let title: String
    public let created: Date
    public let heartCount: Int
    public let commentCount: Int
    public let heartStatus: Bool
}
