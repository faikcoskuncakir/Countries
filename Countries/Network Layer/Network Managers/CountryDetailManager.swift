//
//  CountryDetailManager.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import Foundation

protocol CountryDetailManagerProtocol {
    func getCountryDetail(countryCode: String, completionHandler: @escaping (CountryModel?, String?) -> Void)
}

class CountryDetailManager: CountryDetailManagerProtocol {
    func getCountryDetail(countryCode: String, completionHandler: @escaping (CountryModel?, String?) -> Void) {
        let url = Endpoints.countries.urlString + countryCode
        NetworkService.shared.requestWithURLSession(url: url, method: .get) { (response: Result<CountryModel, NetworkErrors>) in
            switch response {
            case .success(let items):
                completionHandler(items, nil)
            case .failure(let error):
                completionHandler(nil, error.rawValue)
            }
        }
    }
}
