//
//  VehicleCacheRepo.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

final class VehicleCacheRepo {
    @MainActor
    var vehicleResponses: [URL: VehicleResponse] = [:]
}

extension VehicleCacheRepo: DependencyIdentifier {
    static var dependencyValue: DependencyFactory<VehicleCacheRepo> {
        DependencyFactory { _ in
            VehicleCacheRepo()
        }
    }
}
