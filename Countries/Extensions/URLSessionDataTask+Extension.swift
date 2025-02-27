//
//  URLSessionDataTask+Extension.swift
//  Countries
//
//  Created by Cakir, Faik on 27.02.2025.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
