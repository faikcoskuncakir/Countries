//
//  HomeLineView.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import SwiftUI

struct HomeLineView: View {
    
    @ObservedObject var viewModel: HomeLineViewModel
    @EnvironmentObject var favoriteListHelper: FavoriteListHelper
    
    init(country: Country, favoriteListHelper: FavoriteListHelper) {
        _viewModel = ObservedObject(wrappedValue: HomeLineViewModel(country: country, favoriteListHelper: favoriteListHelper))
    }
    
    var body: some View {
        
        HStack {
            Text(viewModel.country.name)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "star.fill")
                .font(.title)
                .padding(.trailing, 2)
                .foregroundColor(viewModel.isFavorite ? .yellow : .black)
                .onTapGesture {
                    viewModel.toggleFavorite()
                }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.width / 7)
        .background(Color.gray)
        .cornerRadius(20)
        
    }
}
