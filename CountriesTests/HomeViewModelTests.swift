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
        // Test için mock data hazırlıyoruz
        let expectedCountries = [Country(code: "US", currencyCodes: ["USD"], name: "United States", wikiDataID: "Q30")]
        mockCountriesManager.mockCountries = expectedCountries
        mockCountriesManager.mockError = nil
        
        // Act
        viewModel.fetchCountries()
        
        // Assert
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
