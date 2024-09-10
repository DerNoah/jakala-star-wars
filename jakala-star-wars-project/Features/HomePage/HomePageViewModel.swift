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
    private let peopleFilterService: PeopleFilterService
    
    @Published var viewState: HomePageViewState = .init()
    
    private var fetchTask: Task<Void, Never>?
    private var fetchedPeople: [People] = []
    
    init(
        coordinator: any Coordinator,
        peopleListService: PeopleListService,
        peopleFilterService: PeopleFilterService
    ) {
        self.coordinator = coordinator
        self.peopleListService = peopleListService
        self.peopleFilterService = peopleFilterService
    }
    
    func onAppear() {
        fetchPeople()
    }
    
    func onListItemTapped(itemModel: ListItemView.Model) {
        guard let selectedPeople = fetchedPeople.first(where: { $0.id == itemModel.id }) else { return } // TODO: error handling
        coordinator.push(destination: DetailPageDestination(arguments: .init(people: selectedPeople)))
    }
    
    func searchStringChanged(_ searchString: String) {
        updateViewState()
    }
    
    private func updateViewState() {
        let filteredRowModels = peopleFilterService.filterPeopleBy(\.name, people: fetchedPeople, searchString: viewState.searchString)
        let mappedRowModels = mapPeopleIntoRowModels(filteredRowModels)
        viewState.listItems = mappedRowModels
    }
    
    private func fetchPeople() {
        guard fetchedPeople.isEmpty else { return }
        
        fetchTask?.cancel()
        
        let peopleFetchStream = peopleListService.fetchAllPeople()
        fetchTask = Task {
            do {
                for try await people in peopleFetchStream {
                    await peopleFetched(people: people)
                }
            } catch {
                print(error)
                // do error handling
            }
        }
    }
    
    @MainActor
    private func peopleFetched(people: [People]) {
        fetchedPeople += people
        updateViewState()
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
