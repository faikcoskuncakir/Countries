//
//  NetworkServiceTests.swift
//  CountriesTests
//
//  Created by Cakir, Faik on 23.02.2025.
//

import XCTest
@testable import Countries

class NetworkServiceTests: XCTestCase {
    var mockSession: MockURLSession!
    var networkService: NetworkService!
    
    override func setUp() {
        super.setUp()
        mockSession = MockURLSession()
        networkService = NetworkService(session: mockSession)
    }
    
    override func tearDown() {
        mockSession = nil
        networkService = nil
        super.tearDown()
    }
    
    // Test with valid response
    func testRequestWithValidResponse() {
        guard let jsonData = loadJSONFromFile(name: "CountriesModel+MockResponse") else {
            XCTFail("Failed to load JSON from file")
            return
        }
        mockSession.data = jsonData
        
        let expectation = self.expectation(description: "Valid response")
        
        networkService.requestWithURLSession(url: "https://example.com", method: .get) { (result: Result<CountriesModel, NetworkErrors>) in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.data.count, 2) // 2 countries in the response
                XCTAssertEqual(model.data.first?.name, "United States")
                XCTAssertEqual(model.data.last?.name, "Turkey")
                XCTAssertEqual(model.data.first?.currencyCodes, ["USD"])
                XCTAssertEqual(model.data.last?.currencyCodes, ["TRY"])
                XCTAssertNotNil(model.data.first?.wikiDataID)
                expectation.fulfill()
            case .failure:
                XCTFail("Expected success but got failure")
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    // Test with error
    func testRequestWithError() {
        mockSession.error = NetworkErrors.generalError
        
        let expectation = self.expectation(description: "Error response")
        
        networkService.requestWithURLSession(url: "https://example.com", method: .get) { (result: Result<CountriesModel, NetworkErrors>) in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual(error, .generalError)
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    // Test with invalid URL
    func testRequestWithInvalidURL() {
        let expectation = self.expectation(description: "Invalid URL response")
        
        networkService.requestWithURLSession(url: "invalid_url", method: .get) { (result: Result<CountriesModel, NetworkErrors>) in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual(error, .invalidURL)
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    // Test with invalid data (invalid JSON)
    func testRequestWithInvalidData() {
        let invalidJsonData = "{\"invalid\": \"json\"}".data(using: .utf8)!
        mockSession.data = invalidJsonData
        
        let expectation = self.expectation(description: "Invalid data response")
        
        networkService.requestWithURLSession(url: "https://example.com", method: .get) { (result: Result<CountriesModel, NetworkErrors>) in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual(error, .invalidData)
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    // Test with empty data
    func testRequestWithEmptyData() {
        mockSession.data = Data() // Empty data
        
        let expectation = self.expectation(description: "Empty data response")
        
        networkService.requestWithURLSession(url: "https://example.com", method: .get) { (result: Result<CountriesModel, NetworkErrors>) in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                XCTAssertEqual(error, .invalidData)
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}

