//
//  DetailPageViewModel.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

final class DetailPageViewModel: ObservableObject {
    private let arguments: DetailPageViewModelArguments
    
    @Published var viewState: DetailPageViewState = .init()
    
    init(arguments: DetailPageViewModelArguments) {
        self.arguments = arguments
        
        prepareInitialViewState()
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
}
