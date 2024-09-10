//
//  PeopleListService.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

final class PeopleListService {
    private let apiRepo: PeopleListApiRepo
    
    init(apiRepo: PeopleListApiRepo) {
        self.apiRepo = apiRepo
    }
}

extension PeopleListService: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<PeopleListService> {
        DependencyFactory { diContainer in
            PeopleListService(apiRepo: diContainer.resolve(PeopleListApiRepo.self))
        }
    }
}
