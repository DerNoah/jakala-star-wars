//
//  ListItemView.swift
//  jakala-star-wars-project
//
//  Created by Noah Plützer on 10.09.24.
//

import SwiftUI

struct ListItemView: View {
    let model: Model
    
    var body: some View {
        HStack(spacing: 12) {
            Text(model.title)
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 22)
                            
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(.trailing)
        }
        .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(Color.cardBackground))
    }
}

extension ListItemView {
    struct Model: Hashable, Identifiable {
        let id: UUID
        let title: String
    }
}
