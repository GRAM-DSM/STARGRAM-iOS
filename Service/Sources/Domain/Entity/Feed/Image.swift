import Foundation

public struct Image: Equatable {
    public let older: Int
    public let imageUrl: URL

    public init(
        older: Int,
        imageUrl: URL
    ) {
        self.older = older
        self.imageUrl = imageUrl
    }
}
