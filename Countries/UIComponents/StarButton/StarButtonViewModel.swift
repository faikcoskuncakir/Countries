//
//  StarButtonViewModel.swift
//  Countries
//
//  Created by Cakir, Faik on 22.02.2025.
//

import SwiftUI

class StarButtonViewModel: ObservableObject {
    @Published var isFavorite: Bool
    let country: Country
    private var favoriteListHelper: FavoriteListHelper
    
    init(country: Country, favoriteListHelper: FavoriteListHelper) {
        self.country = country
        self.favoriteListHelper = favoriteListHelper
        self.isFavorite = favoriteListHelper.isFavorite(country: country)
    }
    
    func toggleFavorite() {
        if isFavorite {
            favoriteListHelper.removeFavorite(country: country)
        } else {
            favoriteListHelper.addFavorite(country: country)
        }
        isFavorite.toggle()
    }
}
