//
//  People.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

struct People: Hashable {
    let id: UUID
    let name: String
    let height: Int
    let mass: Int
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: Gender?
    let homeworldURL: URL?
    let vehicleURLs: [URL]
}

enum Gender: String {
    case male
    case female
    case hermaphrodite
}
