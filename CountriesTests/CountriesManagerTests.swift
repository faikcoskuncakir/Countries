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
        mockSession = MockURLSession()
        countriesManager = CountriesManager()
    }
    
    override func tearDown() {
        countriesManager = nil
        mockSession = nil
        super.tearDown()
    }
    
    func testGetAllCountriesSuccess() {
        guard let jsonData = loadJSONFromFile(name: "CountriesModel+MockResponse") else {
            XCTFail("Failed to load JSON from file")
            return
        }
        mockSession.data = jsonData
        mockSession.error = nil
        
        countriesManager.getAllCountries { countries, error in
            XCTAssertNotNil(countries)
            XCTAssertEqual(countries?.count, 2)
            XCTAssertEqual(countries?.first?.name, "United States")
            XCTAssertEqual(countries?.last?.name, "Turkey")
            XCTAssertNil(error)
        }
    }
    
    func testGetAllCountriesFailure() {
        mockSession.data = nil
        mockSession.error = NSError(domain: "NetworkError", code: 1, userInfo: nil)
        
        countriesManager.getAllCountries { countries, error in
            XCTAssertNil(countries)
            XCTAssertNotNil(error)
            XCTAssertEqual(error, NetworkErrors.generalError.rawValue)
        }
    }
}
