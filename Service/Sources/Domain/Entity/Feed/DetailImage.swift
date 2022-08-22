import Foundation

public struct DetailImage: Equatable {
    public let older: Int
    public let imageUrl: String

    public init(
        older: Int,
        imageUrl: String
    ) {
        self.older = older
        self.imageUrl = imageUrl
    }
}
