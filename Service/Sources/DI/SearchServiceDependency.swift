import Foundation

import Combine

public struct SearchServiceDependency {
    public let searchUseCase: SearchUseCase
}

public extension SearchServiceDependency {

    static func resolve() -> SearchServiceDependency {
        let searchRepository = SearchRepositoryImpl()

        let searchUseCase = SearchUseCase(
            repository: searchRepository
        )

        return .init(searchUseCase: searchUseCase)
    }

}
