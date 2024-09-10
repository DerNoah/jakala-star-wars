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
    
    init(coordinator: any Coordinator) {
        self.coordinator = coordinator
    }
}
