//
//  PeopleListApiRepo.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

final class PeopleListApiRepo {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchPeopleList() async throws -> PeopleListResponseModel {
        guard let url = URL(string: "https://swapi.dev/api/people") else { throw Error.invalidURL }
        
        return try await apiClient.request(url)
    }
}

extension PeopleListApiRepo {
    enum Error: Swift.Error {
        case invalidURL
    }
}

extension PeopleListApiRepo: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<PeopleListApiRepo> {
        DependencyFactory { diContainer in
            PeopleListApiRepo(apiClient: diContainer.resolve(APIClient.self))
        }
    }
}
