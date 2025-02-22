//
//  ProfileViewModel.swift
//  Countries
//
//  Created by Cakir, Faik on 22.02.2025.
//

import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    
    private var countryDetailManager: CountryDetailManagerProtocol
    private var locationManager: LocationManager
    private var cancellables = Set<AnyCancellable>()
    
    @Published var country: DataStruct = DataStruct()
    
    init(countryDetailManager: CountryDetailManagerProtocol = CountryDetailManager(), locationManager: LocationManager = LocationManager()) {
        self.countryDetailManager = countryDetailManager
        self.locationManager = locationManager
        
        self.locationManager.$countryCode
            .compactMap { $0 }
            .sink { [weak self] newCode in
                self?.fetchCountryDetails(for: newCode)
            }
            .store(in: &cancellables)
    }
    
    private func fetchCountryDetails(for countryCode: String) {
        self.countryDetailManager.getCountryDetail(countryCode: countryCode) { countryDetail, error in
            DispatchQueue.main.async {
                if let countryDetail = countryDetail {
                    self.country = countryDetail.country
                }
            }
        }
    }

}
