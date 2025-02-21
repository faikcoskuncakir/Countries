//
//  NotesManager.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import Foundation

protocol CountriesManagerProtocol {
    func getAllCountries(completionHandler: @escaping ([Country]?, String?) -> Void)
}

class CountriesManager: CountriesManagerProtocol {
    func getAllCountries(completionHandler: @escaping ([Country]?, String?) -> Void) {
        let url = Endpoints.countries.urlString
        
        let queryItems = [
            URLQueryItem(name: "limit", value: "10")
        ]
        
        NetworkService.shared.requestWithURLSession(url: url, method: .get, queryItems: queryItems) { (response: Result<CountriesModel, NetworkErrors>) in
            DispatchQueue.main.async {
                switch response {
                case .success(let countriesModel):
                    completionHandler(countriesModel.data, nil)
                case .failure(let error):
                    completionHandler(nil, error.rawValue)
                }
            }
        }
    }
}
