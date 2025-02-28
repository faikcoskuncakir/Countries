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
    
    init(countriesManager: CountriesManagerProtocol = CountriesManager()) {
        self.countriesManager = countriesManager
        fetchCountries()
    }
    
    func fetchCountries() {
        countriesManager.getAllCountries { allCountries, error in
            if (error != nil) {
                DispatchQueue.main.async {
                    self.showAlert = true
                }
            }
            DispatchQueue.main.async {
                self.countries = allCountries ?? [Country]()
            }
        }
    }
    
}
