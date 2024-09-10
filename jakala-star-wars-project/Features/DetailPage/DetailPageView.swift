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
        ZStack {
            Color.orange
                .ignoresSafeArea()
            
            ScrollView {
                VStack() {
                    Text(viewModel.viewState.title)
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 120)
                    
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
                    .padding()
                    
                    Spacer()
                }
            }
        }
        .ignoresSafeArea(.all, edges: .top)
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
                    homeworldURL: nil
                )
            )
        )
    )
}
