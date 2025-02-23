//
//  CountryDetailManagerTests.swift
//  CountriesTests
//
//  Created by Cakir, Faik on 23.02.2025.
//

import XCTest
@testable import Countries

class CountryDetailManagerTests: XCTestCase {
    
    var countryDetailManager: CountryDetailManager!
    var mockSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        mockSession = MockURLSession()
        countryDetailManager = CountryDetailManager()
    }
    
    override func tearDown() {
        countryDetailManager = nil
        mockSession = nil
        super.tearDown()
    }
    
    func testGetCountryDetailSuccess() {
        guard let jsonData = loadJSONFromFile(name: "CountriesModel+MockResponse") else {
            XCTFail("Failed to load JSON from file")
            return
        }
        mockSession.data = jsonData
        mockSession.error = nil
        
        countryDetailManager.getCountryDetail(countryCode: "US") { country, error in
            XCTAssertNotNil(country)
            XCTAssertEqual(country?.country.code, "US")
            XCTAssertEqual(country?.country.name, "United States")
            XCTAssertEqual(country?.country.capital, "Washington, D.C.")
            XCTAssertEqual(country?.country.currencyCodes.first, "USD")
            XCTAssertNil(error)
        }
    }
    
    func testGetCountryDetailFailure() {
        mockSession.data = nil
        mockSession.error = NSError(domain: "NetworkError", code: 1, userInfo: nil)
        
        countryDetailManager.getCountryDetail(countryCode: "INVALID") { country, error in
            XCTAssertNil(country)
            XCTAssertNotNil(error)
            XCTAssertEqual(error, NetworkErrors.generalError.rawValue)
        }
    }
}
