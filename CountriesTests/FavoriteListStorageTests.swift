//
//  CountriesTests.swift
//  CountriesTests
//
//  Created by Cakir, Faik on 23.02.2025.
//

import XCTest
@testable import Countries

final class FavoriteListStorageTests: XCTestCase {
    
    var storage: FavoriteListStorage!
    var mockUserDefaults: UserDefaults!
    
    override func setUp() {
        super.setUp()
        mockUserDefaults = UserDefaults(suiteName: "testSuite")
        mockUserDefaults.removePersistentDomain(forName: "testSuite")
        storage = FavoriteListStorage(userDefaults: mockUserDefaults)
    }
    
    override func tearDown() {
        mockUserDefaults.removePersistentDomain(forName: "testSuite")
        mockUserDefaults = nil
        storage = nil
        super.tearDown()
    }
    
    func testSetAndGetFavoriteList() {
        let country1 = Country(code: "TR", name: "Turkey")
        let country2 = Country(code: "DE", name: "Germany")
        let expectedCountries = [country1, country2]
        
        storage.setFavoriteList(countryList: expectedCountries)
        let retrievedCountries = storage.getFavoriteList()
        
        XCTAssertEqual(retrievedCountries.count, expectedCountries.count, "Country list count should match")
        XCTAssertEqual(retrievedCountries.first?.name, "Turkey", "First country should be Turkey")
        XCTAssertEqual(retrievedCountries.last?.code, "DE", "Last country should be Germany")
    }
    
    func testGetFavoriteList_WhenNoDataExists_ShouldReturnEmptyArray() {
        let retrievedCountries = storage.getFavoriteList()
        
        XCTAssertTrue(retrievedCountries.isEmpty, "Favorite list should be empty if no data is set")
    }
}

