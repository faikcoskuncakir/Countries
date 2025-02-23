//
//  MockCountriesMAnager.swift
//  CountriesTests
//
//  Created by Cakir, Faik on 23.02.2025.
//

import XCTest
@testable import Countries

class MockCountriesManager: CountriesManagerProtocol {
    
    var mockCountries: [Country]?
    var mockError: String?
    
    func getAllCountries(completionHandler: @escaping ([Country]?, String?) -> Void) {
        completionHandler(mockCountries, mockError)
    }
}
