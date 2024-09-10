//
//  VehicleService.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

final class VehicleService {
    private let apiRepo: VehicleApiRepo
    private let cacheRepo: VehicleCacheRepo
    
    init(apiRepo: VehicleApiRepo, cacheRepo: VehicleCacheRepo) {
        self.apiRepo = apiRepo
        self.cacheRepo = cacheRepo
    }
    
    func fetchVehicle(vehicleURL: URL) async throws -> Vehicle {
        let vehicleResponse: VehicleResponse
        if let cachedResponse = await cacheRepo.vehicleResponses[vehicleURL] {
            vehicleResponse = cachedResponse
        } else {
            vehicleResponse = try await apiRepo.fetchVehicle(vehicleURL: vehicleURL)
            await MainActor.run {
                cacheRepo.vehicleResponses[vehicleURL] = vehicleResponse
            }
        }
        
        let mappedVehicle = Vehicle(
            id: UUID(),
            name: vehicleResponse.name,
            model: vehicleResponse.model,
            manufacturer: vehicleResponse.manufacturer,
            costInCredits: vehicleResponse.costInCredits,
            length: vehicleResponse.length,
            maxAtmospheringSpeed: vehicleResponse.name,
            crew: vehicleResponse.crew,
            passengers: vehicleResponse.passengers,
            cargoCapacity: vehicleResponse.cargoCapacity,
            consumables: vehicleResponse.consumables,
            vehicleClass: vehicleResponse.vehicleClass,
            pilotURLs: vehicleResponse.pilotURLs,
            filmURLs: vehicleResponse.filmURLs
        )
        
        return mappedVehicle
    }
    
    func fetchVehicles(vehicleURLs: [URL]) async throws -> [Vehicle] {
        try await withThrowingTaskGroup(of: Vehicle.self) { group in
            for url in vehicleURLs {
                group.addTask {
                    let vehicle = try await self.fetchVehicle(vehicleURL: url)
                    return vehicle
                }
            }
                
            var vehicles: [Vehicle] = []
                
            for try await vehicle in group {
                vehicles.append(vehicle)
            }
                
            return vehicles
        }
    }
}

extension VehicleService: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<VehicleService> {
        DependencyFactory { diContainer in
            VehicleService(
                apiRepo: diContainer.resolve(VehicleApiRepo.self),
                cacheRepo: diContainer.resolve(VehicleCacheRepo.self)
            )
        }
    }
}
