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
    
    func fetchPeople() async throws -> [People] {
        let peopleResponse = try await apiRepo.fetchPeopleList()
        let mappedPeople = peopleResponse.results.compactMap { people -> People? in
            guard let height = Int(people.height),
                  let mass = Int(people.mass) else { return nil }
            
            return People(
                id: UUID(),
                name: people.name,
                height: height,
                mass: mass,
                hairColor: people.hairColor,
                skinColor: people.skinColor,
                eyeColor: people.eyeColor,
                birthYear: people.birthYear,
                gender: .init(rawValue: people.gender.rawValue),
                homeworldURL: people.homeworldURL
            )
        }
        
        return mappedPeople
    }
}

extension PeopleListService: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<PeopleListService> {
        DependencyFactory { diContainer in
            PeopleListService(apiRepo: diContainer.resolve(PeopleListApiRepo.self))
        }
    }
}
