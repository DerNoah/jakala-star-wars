//
//  DetailPageDestination.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation
import SUICoordinator

struct DetailPageDestination: Destination {
    let identifier = PageIdentifier.detailPage
    
    let arguments: DetailPageViewModelArguments
    
    func makeView(with dependencies: DependencyContainer, coordinator: any Coordinator) -> DetailPageView {
        DetailPageView(
            viewModel: DetailPageViewModel(
                arguments: arguments,
                vehicleService: dependencies.resolve(VehicleService.self)
            )
        )
    }
}
