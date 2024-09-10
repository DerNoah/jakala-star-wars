//
//  ContentView.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import SUICoordinator
import SwiftUI

struct ProjectRootView: View {
    let dependencyContainer = DependencyContainer(environment: .prod)
    
    var body: some View {
        NavigationCoordinatorView(
            dependencies: dependencyContainer,
            rootView: {
                coordinator in
                HomePageView(
                    viewModel: HomePageViewModel(
                        coordinator: coordinator,
                        peopleListService: dependencyContainer.resolve(PeopleListService.self),
                        peopleFilterService: dependencyContainer.resolve(PeopleFilterService.self)
                    )
                )
            }
        )
    }
}

#Preview {
    ProjectRootView()
}

#if DEBUG
let previewDependencyContainer = DependencyContainer(environment: .preview)
#endif
