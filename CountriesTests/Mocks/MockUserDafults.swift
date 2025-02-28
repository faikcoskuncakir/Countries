//
//  MockUserDafults.swift
//  CountriesTests
//
//  Created by Cakir, Faik on 27.02.2025.
//

import XCTest
@testable import Countries

class MockUserDefaults: UserDefaultsProtocol {
    private var storage: [String: Any] = [:]

    func set(_ value: Any?, forKey defaultName: String) {
        storage[defaultName] = value
    }

    func object(forKey defaultName: String) -> Any? {
        return storage[defaultName]
    }

    func removeObject(forKey defaultName: String) {
        storage.removeValue(forKey: defaultName)
    }
}
