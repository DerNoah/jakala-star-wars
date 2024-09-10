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
    
    @Published var viewState: HomePageViewState = .init()
    
    init(coordinator: any Coordinator) {
        self.coordinator = coordinator
    }
    
    func onAppear() {}
    
    func onListItemTapped(itemModel: ListItemView.Model) {
        
    }
}
