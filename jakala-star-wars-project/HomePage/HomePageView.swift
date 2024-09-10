//
//  HomePageView.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import SwiftUI
import SUICoordinator

struct HomePageView: View {
    @ObservedObject var viewModel: HomePageViewModel
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    HomePageView(viewModel: HomePageViewModel(coordinator: AppCoordinator<Void>(navigationPath: .init())))
}
