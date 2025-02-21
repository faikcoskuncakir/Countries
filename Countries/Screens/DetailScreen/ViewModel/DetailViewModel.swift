//
//  DetailViewModel.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var country: Country = Country()
    @Published var countryDetail: DataStruct = DataStruct()
    
    private var countryDetailManager: CountryDetailManagerProtocol
    
    init(country: Country = Country() ,countryDetailManager: CountryDetailManager = CountryDetailManager()) {
        self.country = country
        self.countryDetailManager = countryDetailManager
    }
    
    func fetchCountryDetail() {
        countryDetailManager.getCountryDetail(countryCode: country.code) { countryDetail, error in
            DispatchQueue.main.async {
                self.countryDetail = countryDetail?.country ?? DataStruct()
            }
        }
    }
    
}
