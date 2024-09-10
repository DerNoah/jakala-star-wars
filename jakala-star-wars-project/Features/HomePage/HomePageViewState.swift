//
//  HomePageViewState.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import Foundation

struct HomePageViewState: Hashable {
    var listItems: [ListItemView.Model] = []
    var searchString: String = ""
}
