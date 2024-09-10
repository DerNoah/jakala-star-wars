//
//  HomePageView.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var viewModel: HomePageViewModel
    
    var body: some View {
        List(viewModel.viewState.listItems) { model in
            Button(action: { viewModel.onListItemTapped(itemModel: model) }) {
                ListItemView(model: model)
            }
            .buttonStyle(.plain)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        }
        .searchable(text: $viewModel.viewState.searchString)
        .listStyle(.plain)
        .animation(.default, value: viewModel.viewState.listItems)
        .onChange(of: viewModel.viewState.searchString) { _, newValue in viewModel.searchStringChanged(newValue) }
        .onAppear(perform: viewModel.onAppear)
    }
}

#if DEBUG
#Preview {
    HomePageView(
        viewModel: HomePageViewModel(
            coordinator: previewDependencyContainer.resolve(PreviewCoordinator.self),
            peopleListService: previewDependencyContainer.resolve(PeopleListService.self),
            peopleFilterService: previewDependencyContainer.resolve(PeopleFilterService.self)
        )
    )
}
#endif
