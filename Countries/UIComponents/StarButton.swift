//
//  StarButton.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import SwiftUI

struct StarButton: View {
    
    var country: Country
    @EnvironmentObject var favoriteListHelper: FavoriteListHelper
    
    var body: some View {
        
        Image(systemName: "star.fill")
            .font(.title2)
            .padding(.trailing, 2)
            .foregroundColor(favoriteListHelper.isFavorite(country: country) ? .yellow : .black)
            .onTapGesture {
                if favoriteListHelper.isFavorite(country: country) {
                    favoriteListHelper.removeFavorite(country: country)
                } else {
                    favoriteListHelper.addFavorite(country: country)
                }
            }
    }
}
