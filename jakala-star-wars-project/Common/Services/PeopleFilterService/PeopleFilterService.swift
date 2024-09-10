//
//  PeopleFilterService.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

final class PeopleFilterService {
    func filterPeopleBy(_ keyPath: KeyPath<People, String>, people: [People], searchString: String) -> [People] {
        guard !searchString.isEmpty else { return people }
        return people.filter {
            $0[keyPath: keyPath].lowercased().contains(searchString.lowercased())
        }
    }
}

extension PeopleFilterService: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<PeopleFilterService> {
        DependencyFactory { _ in
            PeopleFilterService()
        }
    }
}
