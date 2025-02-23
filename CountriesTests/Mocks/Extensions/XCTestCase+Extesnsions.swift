//
//  XCTestCase+Extesnsions.swift
//  CountriesTests
//
//  Created by Cakir, Faik on 23.02.2025.
//

import XCTest

extension XCTestCase {
    func loadJSONFromFile(name: String) -> Data? {
        guard let path = Bundle(for: type(of: self)).path(forResource: name, ofType: "json") else {
            print("File not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } catch {
            print("Error loading file: \(error)")
            return nil
        }
    }
}
