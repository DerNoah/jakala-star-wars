//
//  VehicleDetailView.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import SwiftUI

struct VehicleDetailView: View {
    let model: Model
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color.black.opacity(0.1))
            
            VStack(alignment: .leading) {
                Text(model.name)
                    .font(.headline)
                Text(model.model)
                
                Spacer()
                
                Text(model.price)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
        }
    }
}

extension VehicleDetailView {
    struct Model: Identifiable, Hashable {
        let id: UUID
        let name: String
        let model: String
        let price: String
    }
}

#Preview {
    VehicleDetailView(
        model: .init(
            id: UUID(),
            name: "X-Wing",
            model: "space ship",
            price: "1000"
        )
    )
}
