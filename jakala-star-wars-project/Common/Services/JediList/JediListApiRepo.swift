//
//  JediListApiRepo.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

final class JediListApiRepo {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}

extension JediListApiRepo: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<JediListApiRepo> {
        DependencyFactory { diContainer in
            JediListApiRepo(apiClient: diContainer.resolve(APIClient.self))
        }
    }
}
