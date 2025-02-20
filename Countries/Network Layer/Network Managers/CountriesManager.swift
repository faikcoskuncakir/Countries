//
//  NotesManager.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import Foundation

class CountriesManager: ObservableObject {
    
    @Published var countryList: [Country] = []
    @Published var showAlert: Bool = false
    
    init() {
        getAllCountries()
    }
    
    /// Retrieves all countries from the endpoint and sets it to countryList environment variable
    func getAllCountries() {
        let url = Endpoints.countries.urlString
        
        let queryItems = [
            URLQueryItem(name: "limit", value: "10")
        ]
        
        NetworkService.shared.requestWithURLSession(url: url, method: .get, queryItems: queryItems) { (response: Result<CountriesModel, NetworkErrors>) in
            DispatchQueue.main.async {
                switch response {
                case .success(let countriesModel):
                    self.countryList = countriesModel.data
                case .failure:
                    self.showAlert = true
                }
            }
        }
    }
}
