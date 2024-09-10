//
//  DetailPageView.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import SwiftUI

struct DetailPageView: View {
    @ObservedObject var viewModel: DetailPageViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 80) {
                Text(viewModel.viewState.title)
                    .font(.largeTitle)
                    .bold()
                
                peopleSection
                
                if !viewModel.viewState.vehicleModels.isEmpty {
                    vehicleSection
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 128)
        }
        .ignoresSafeArea(.all, edges: .top)
        .onAppear(perform: viewModel.onAppear)
    }
    
    private var peopleSection: some View {
        VStack(alignment: .leading) {
            Text("About \(viewModel.viewState.biographyName)")
                .font(.headline)
                .bold()
            Text(viewModel.viewState.biography)
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).foregroundStyle(.gray))
    }
    
    private var vehicleSection: some View {
        VStack(alignment: .leading) {
            Text("Vehicles")
                .font(.headline)
                .bold()
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                ForEach(viewModel.viewState.vehicleModels) { model in
                    VehicleDetailView(model: model)
                }
            }
            .animation(.default, value: viewModel.viewState.vehicleModels)
        }
    }
}

#Preview {
    DetailPageView(
        viewModel: DetailPageViewModel(
            arguments: DetailPageViewModelArguments(
                people: People(
                    id: UUID(),
                    name: "Anakin Skywalker",
                    height: 170,
                    mass: 80,
                    hairColor: "blond",
                    skinColor: "light",
                    eyeColor: "green",
                    birthYear: "41.9 BBY",
                    gender: .male,
                    homeworldURL: nil,
                    vehicleURLs: []
                )
            ),
            vehicleService: previewDependencyContainer.resolve(VehicleService.self)
        )
    )
}
