//
//  FavoriteListStorage.swift
//  Countries
//
//  Created by Faik on 5.11.2022.
//

import Foundation

class FavoriteListStorage {
    
    private let userDefaults: UserDefaults
    private let countryKey = "country"
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func getFavoriteList() -> [Country] {
        if let country = userDefaults.object(forKey: countryKey) as? Data {
            let decoder = JSONDecoder()
            if let loadedCountry = try? decoder.decode([Country].self, from: country) {
                return loadedCountry
            }
        }
        return []
    }
    
    func setFavoriteList(countryList: [Country]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(countryList) {
            userDefaults.set(encoded, forKey: countryKey)
        }
    }
}
