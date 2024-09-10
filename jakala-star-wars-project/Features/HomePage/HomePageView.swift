//
//  HomePageView.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import SwiftUI

struct HomePageView: View {
    @ObservedObject var viewModel: HomePageViewModel
    
    @State private var searchString = ""
    
    var body: some View {
        List(viewModel.viewState.listItems) { model in
            Button(action: { viewModel.onListItemTapped(itemModel: model) }) {
                ListItemView(model: model)
            }
            .buttonStyle(.plain)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        }
        .searchable(text: $searchString)
        .listStyle(.plain)
        .animation(.default, value: viewModel.viewState.listItems)
        .onAppear(perform: viewModel.onAppear)
    }
}

#if DEBUG
#Preview {
    HomePageView(
        viewModel: HomePageViewModel(
            coordinator: previewDependencyContainer.resolve(PreviewCoordinator.self),
            peopleListService: previewDependencyContainer.resolve(PeopleListService.self)
        )
    )
}
#endif
