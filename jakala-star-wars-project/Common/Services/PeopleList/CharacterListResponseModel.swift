//
//  PeopleListResponseModel.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

struct PeopleListResponseModel: Decodable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [People]
}

extension PeopleListResponseModel {
    struct People: Decodable {
        let name: String
        let height: Int
        let mass: Int
        let hairColor: String
        let skinColor: String
        let eyeColor: String
        let birthYear: String
        let gender: Gender
        let homeworldURL: URL
        let filmURLs: [URL]
        
        enum CodingKeys: String, CodingKey {
            case name
            case height
            case mass
            case hairColor = "hair_color"
            case skinColor = "skin_color"
            case eyeColor = "eye_color"
            case birthYear = "birth_year"
            case gender
            case homeworldURL = "homeworld"
            case filmURLs = "films"
        }
    }
}

extension PeopleListResponseModel.People {
    enum Gender: String, Decodable {
        case male
        case female
        case none = "n/a"
    }
}
