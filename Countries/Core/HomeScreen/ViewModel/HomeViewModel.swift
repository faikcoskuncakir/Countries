//
//  HomeViewModel.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import Foundation
import SwiftUI

struct HomeLineView: View {
    
    @EnvironmentObject var favoriteListHelper: FavoriteListHelper
    var country: Country
    
    var body: some View {
        
        HStack {
            Text(country.name)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "star.fill")
                .font(.title)
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
        .padding()
        .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.width / 7)
        .background(Color.gray)
        .cornerRadius(20)
        
    }
}


