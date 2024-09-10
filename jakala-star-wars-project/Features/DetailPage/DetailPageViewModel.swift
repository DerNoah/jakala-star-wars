//
//  DetailPageViewModel.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

final class DetailPageViewModel: ObservableObject {
    private let arguments: DetailPageViewModelArguments
    
    private let vehicleService: VehicleService
    
    @Published var viewState: DetailPageViewState = .init()
    
    private var fetchedVehicles: [Vehicle] = []
    
    init(arguments: DetailPageViewModelArguments, vehicleService: VehicleService) {
        self.arguments = arguments
        self.vehicleService = vehicleService
        
        prepareInitialViewState()
    }
    
    func onAppear() {
        fetchVehicles(vehicleURLs: arguments.people.vehicleURLs)
    }
    
    private func prepareInitialViewState() {
        viewState.title = arguments.people.name
        
        if let splittedName = arguments.people.name.split(separator: " ").first {
            viewState.biographyName = String(splittedName)
        } else {
            viewState.biographyName = arguments.people.name
        }
        
        viewState.biography = "born in: " + arguments.people.birthYear + "\n" +
            "eye color: " + arguments.people.eyeColor + "\n" +
            "hair color: " + arguments.people.hairColor + "\n" +
            "skin color: " + arguments.people.skinColor
    }
    
    private func fetchVehicles(vehicleURLs: [URL]) {
        Task {
            let vehicles = try await vehicleService.fetchVehicles(vehicleURLs: vehicleURLs)
            
            await MainActor.run {
                vehiclesFetched(vehicles: vehicles)
            }
        }
    }
    
    private func vehiclesFetched(vehicles: [Vehicle]) {
        fetchedVehicles = vehicles
        viewState.vehicleModels = vehicles.map {
            VehicleDetailView.Model(
                id: $0.id,
                name: $0.name,
                model: $0.model,
                price: $0.costInCredits + " Cr."
            )
        }
    }
}
