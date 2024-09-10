//
//  HomePageViewModel.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation
import SUICoordinator

final class HomePageViewModel: ObservableObject {
    private let coordinator: any Coordinator
    private let peopleListService: PeopleListService
    
    @Published var viewState: HomePageViewState = .init()
    
    private var fetchTask: Task<Void, Never>?
    private var fetchedPeople: [People] = []
    
    init(coordinator: any Coordinator, peopleListService: PeopleListService) {
        self.coordinator = coordinator
        self.peopleListService = peopleListService
    }
    
    func onAppear() {
        fetchPeople()
    }
    
    func onListItemTapped(itemModel: ListItemView.Model) {}
    
    private func fetchPeople() {
        fetchTask?.cancel()
        fetchTask = Task {
            do {
                let people = try await self.peopleListService.fetchPeople()
                
                await peopleFetched(people: people)
            } catch {
                // do error handling
            }
        }
    }
    
    @MainActor
    private func peopleFetched(people: [People]) {
        self.fetchedPeople = people
        let mappedRowModels = mapPeopleIntoRowModels(people)
        viewState.listItems = mappedRowModels
    }
    
    private func mapPeopleIntoRowModels(_ people: [People]) -> [ListItemView.Model] {
        people.map {
            ListItemView.Model(
                id: $0.id,
                title: $0.name
            )
        }
    }
}
