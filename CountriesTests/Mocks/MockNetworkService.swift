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
        let task = MockURLSessionDataTask()
        task.resumeHandler = { [weak self] in
            completionHandler(self?.data, self?.response, self?.error)
        }
        return task
    }
}


class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    var resumeHandler: (() -> Void)?
    func resume() {
        resumeHandler?()
    }
}
