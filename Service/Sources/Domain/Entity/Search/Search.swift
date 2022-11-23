import Foundation

public struct Search: Equatable {
    public let feedId: String
    public let title: String
    public let createAt: Date
    public let heartCount: Int
    public let commentCount: Int
    public let image: String
}
