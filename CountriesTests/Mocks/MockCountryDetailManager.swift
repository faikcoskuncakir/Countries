//
//  MockCountryDetailManager.swift
//  CountriesTests
//
//  Created by Cakir, Faik on 23.02.2025.
//

import XCTest
@testable import Countries

class MockCountryDetailManager: CountryDetailManagerProtocol {
    
    var mockCountryModel: CountryModel?
    var mockError: String?
    
    func getCountryDetail(countryCode: String, completionHandler: @escaping (CountryModel?, String?) -> Void) {
        completionHandler(mockCountryModel, mockError)
    }
}
