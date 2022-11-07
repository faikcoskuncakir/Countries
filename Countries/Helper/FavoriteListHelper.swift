//
//  FavoriteListHelper.swift
//  Countries
//
//  Created by Faik on 5.11.2022.
//

import Foundation

class FavoriteListHelper: ObservableObject {
    
    @Published var favoriteList: [Country] = [Country]() // List of favorite countries
    var favoriteListStorage = FavoriteListStorage()
    
    init() { // Function that syncs data in UserDefaults to favorite list
        self.favoriteList = self.favoriteListStorage.getFavoriteList()
    }
    
    /// Adds the country to the favorite list and syncs it to UserDefaults
    /// - parameter country: will be added to the favorite list
    func addFavorite(country: Country) {
        favoriteList.append(country)
        favoriteListStorage.setFavoriteList(countryList: favoriteList)
    }
    
    /// Removes the country to the favorite list and syncs it to UserDefaults
    /// - parameter country: will be removed from the favorite list
    func removeFavorite (country: Country) { // Function that deletes the given country from the favorite list and syncs it to UserDefaults
        let wantedIndex = favoriteList.firstIndex(of: country)
        favoriteList.remove(at: wantedIndex ?? 0)
        favoriteListStorage.setFavoriteList(countryList: favoriteList)
    }
    
    /// Chacks whether the country is in the favorites or not.
    /// - returns: true if country is in faorite, otherwise false
    func isFavorite(country: Country) -> Bool {
        return favoriteList.contains(country)
    }
    
}
