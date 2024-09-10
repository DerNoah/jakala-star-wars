//
//  JediListService.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

final class JediListService {
    private let apiRepo: JediListApiRepo
    
    init(apiRepo: JediListApiRepo) {
        self.apiRepo = apiRepo
    }
}

extension JediListService: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<JediListService> {
        DependencyFactory { diContainer in
            JediListService(apiRepo: diContainer.resolve(JediListApiRepo.self))
        }
    }
}
