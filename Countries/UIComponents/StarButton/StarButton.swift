//
//  StarButton.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import SwiftUI

struct StarButton: View {
    @ObservedObject var viewModel: StarButtonViewModel
    
    var body: some View {
        Image(systemName: "star.fill")
            .font(.title2)
            .padding(.trailing, 2)
            .foregroundColor(viewModel.isFavorite ? .yellow : .black)
            .onTapGesture {
                viewModel.toggleFavorite()
            }
    }
}
