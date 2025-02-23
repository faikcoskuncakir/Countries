//
//  HomeViewModelTests.swift
//  CountriesTests
//
//  Created by Cakir, Faik on 23.02.2025.
//

import XCTest
@testable import Countries

class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var mockCountriesManager: MockCountriesManager!
    
    override func setUp() {
        super.setUp()
        mockCountriesManager = MockCountriesManager()
        viewModel = HomeViewModel(countriesManager: mockCountriesManager)
    }
    
    override func tearDown() {
        viewModel = nil
        mockCountriesManager = nil
        super.tearDown()
    }
    
    func testFetchCountriesSuccess() {
        guard let jsonData = loadJSONFromFile(name: "CountriesModel+MockResponse"),
              let expectedCountries = try? JSONDecoder().decode(CountriesModel.self, from: jsonData).data else {
            return XCTFail("Failed to load or decode JSON")
        }

        mockCountriesManager.mockCountries = expectedCountries
        mockCountriesManager.mockError = nil

        viewModel.fetchCountries()

        XCTAssertEqual(viewModel.countries, expectedCountries)
        XCTAssertFalse(viewModel.showAlert)
    }
    
    func testFetchCountriesFailure() {
        // Hata durumunu simüle ediyoruz
        mockCountriesManager.mockCountries = nil
        mockCountriesManager.mockError = "Error fetching countries"
        
        // Act
        viewModel.fetchCountries()
        
        // Assert
        XCTAssertTrue(viewModel.showAlert)
        XCTAssertTrue(viewModel.countries.isEmpty)
    }
}
