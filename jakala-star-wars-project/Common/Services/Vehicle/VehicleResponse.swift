//
//  VehicleResponse.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

struct VehicleResponse: Decodable {
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let maxAtmospheringSpeed: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let consumables: String
    let vehicleClass: String
    let pilotURLs: [URL]
    let filmURLs: [URL]
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew
        case passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case vehicleClass = "vehicle_class"
        case pilotURLs = "pilots"
        case filmURLs = "films"
    }
}
