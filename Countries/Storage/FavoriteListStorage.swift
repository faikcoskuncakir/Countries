//
//  FavoriteListStorage.swift
//  Countries
//
//  Created by Faik on 5.11.2022.
//

import Foundation

class FavoriteListStorage {
    
    let countryKey = "country"
    
    /// Retrieves favorite list from User Defaults
    func getFavoriteList() -> [Country] {
        
        if let country = UserDefaults.standard.object(forKey: countryKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedCountry = try? decoder.decode([Country].self, from: country) {
                return loadedCountry
            }
        }
        return [Country]()
    }
    
    /// Sets favorites to the Use Defaults
    func setFavoriteList(countryList: [Country]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(countryList) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: countryKey)
        }
    }
    
}
