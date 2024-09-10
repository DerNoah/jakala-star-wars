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
        Color.orange
            .ignoresSafeArea()
    }
}

#Preview {
    DetailPageView(viewModel: DetailPageViewModel())
}
