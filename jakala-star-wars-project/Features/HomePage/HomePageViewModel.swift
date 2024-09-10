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
    
    init(coordinator: any Coordinator, peopleListService: PeopleListService) {
        self.coordinator = coordinator
        self.peopleListService = peopleListService
    }
    
    func onAppear() {}
    
    func onListItemTapped(itemModel: ListItemView.Model) {
        
    }
}
