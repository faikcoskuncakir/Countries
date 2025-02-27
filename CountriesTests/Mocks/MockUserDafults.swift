//
//  MockUserDafults.swift
//  CountriesTests
//
//  Created by Cakir, Faik on 27.02.2025.
//

import Foundation

class MockUserDefaults: UserDefaults {
    private var storage: [String: Any] = [:]

    override func set(_ value: Any?, forKey defaultName: String) {
        storage[defaultName] = value
    }

    override func object(forKey defaultName: String) -> Any? {
        return storage[defaultName]
    }

    override func removeObject(forKey defaultName: String) {
        storage.removeValue(forKey: defaultName)
    }
}
