//
//  VehicleApiRepo.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

final class VehicleApiRepo {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchVehicle(vehicleURL: URL) async throws -> VehicleResponse {
        try await apiClient.request(vehicleURL)
    }
}

extension VehicleApiRepo: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<VehicleApiRepo> {
        DependencyFactory { diContainer in
            VehicleApiRepo(apiClient: diContainer.resolve(APIClient.self))
        }
    }
}
