//
//  CountriesManagerTests.swift
//  CountriesTests
//
//  Created by Cakir, Faik on 23.02.2025.
//

import XCTest
@testable import Countries

class CountriesManagerTests: XCTestCase {
    
    var countriesManager: CountriesManager!
    var mockSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        // Mock URLSession oluşturuluyor
        mockSession = MockURLSession()
        countriesManager = CountriesManager()
    }
    
    override func tearDown() {
        countriesManager = nil
        mockSession = nil
        super.tearDown()
    }
    
    func testGetAllCountriesSuccess() {
        // Test için mock data hazırlıyoruz
        let jsonString = """
        {
            "data": [
                {
                    "code": "US",
                    "currencyCodes": ["USD"],
                    "name": "United States",
                    "wikiDataId": "Q30"
                }
            ]
        }
        """
        let jsonData = jsonString.data(using: .utf8)
        mockSession.data = jsonData
        mockSession.error = nil
        
        // Testi çalıştırıyoruz
        countriesManager.getAllCountries { countries, error in
            XCTAssertNotNil(countries)
            XCTAssertEqual(countries?.count, 1)
            XCTAssertEqual(countries?.first?.name, "United States")
            XCTAssertNil(error)
        }
    }
    
    func testGetAllCountriesFailure() {
        // Hata durumunu simüle ediyoruz
        mockSession.data = nil
        mockSession.error = NSError(domain: "NetworkError", code: 1, userInfo: nil)
        
        countriesManager.getAllCountries { countries, error in
            XCTAssertNil(countries)
            XCTAssertNotNil(error)
            XCTAssertEqual(error, NetworkErrors.generalError.rawValue)
        }
    }
}
