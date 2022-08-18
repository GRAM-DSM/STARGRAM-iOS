import Foundation

public struct Profile: Equatable {
    public let name: String
    public let introduce: String
    public let link: String
    public let image: String

    public init(
        name: String,
        introduce: String,
        link: String,
        image: String
    ) {
        self.name = name
        self.introduce = introduce
        self.link = link
        self.image = image
    }
}
