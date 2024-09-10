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
    
    func fetchAllPeople() -> AsyncThrowingStream<[People], Error> {
        AsyncThrowingStream { continuation in
            fetchPeople(completion: { result in
                switch result {
                    case let .success((response, finished)):
                        let mappedPeople = self.mapPeopleResponse(people: response.results)
                        continuation.yield(mappedPeople)
                        if finished {
                            continuation.finish()
                        }
                    case let .failure(error):
                        continuation.finish(throwing: error)
                }
            })
        }
    }
    
    private func fetchPeople(givenPageURL: URL? = nil, completion: @escaping (Result<(PeopleListResponseModel, finished: Bool), Error>) -> Void) {
        Task {
            do {
                let peopleResponse = try await apiRepo.fetchPeopleList(givenPageURL: givenPageURL)
                if let next = peopleResponse.next {
                    completion(.success((peopleResponse, finished: false)))
                    fetchPeople(givenPageURL: next, completion: completion)
                } else {
                    completion(.success((peopleResponse, finished: true)))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    private func mapPeopleResponse(people: [PeopleListResponseModel.People]) -> [People] {
        people.compactMap { people -> People? in
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
                gender: .init(rawValue: people.gender ?? ""),
                homeworldURL: people.homeworldURL
            )
        }
    }
}

extension PeopleListService: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<PeopleListService> {
        DependencyFactory { diContainer in
            PeopleListService(apiRepo: diContainer.resolve(PeopleListApiRepo.self))
        }
    }
}
