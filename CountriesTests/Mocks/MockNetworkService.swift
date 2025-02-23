//
//  MockNetworkService.swift
//  CountriesTests
//
//  Created by Cakir, Faik on 23.02.2025.
//

import XCTest
@testable import Countries

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?

    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        if let error = error {
            completionHandler(nil, nil, error as NSError)
        } else {
            completionHandler(data, nil, nil)
        }
        return MockURLSessionDataTask(resumeHandler: {})
    }
}

struct MockURLSessionDataTask: URLSessionDataTaskProtocol {
    var resumeHandler: (() -> Void)?
    
    func resume() {
        resumeHandler?()
    }
}
