//
//  HomeViewModel.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var countries: [Country] = []
    @Published var showAlert: Bool = false
    
    private var countriesManager: CountriesManagerProtocol
    
    init(countriesManager: CountriesManager = CountriesManager()) {
        self.countriesManager = countriesManager
    }
    
    func fetchCountries() {
        countriesManager.getAllCountries { allCountries, error in
            if (error != nil) {
                self.showAlert = true
            }
            self.countries = allCountries ?? [Country]()
        }
    }
    
}
