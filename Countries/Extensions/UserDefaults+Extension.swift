//
//  UserDefaults+Extension.swift
//  Countries
//
//  Created by Cakir, Faik on 28.02.2025.
//

import Foundation

protocol UserDefaultsProtocol {
    func set(_ value: Any?, forKey defaultName: String)
    func object(forKey defaultName: String) -> Any?
    func removeObject(forKey defaultName: String)
}

extension UserDefaults: UserDefaultsProtocol {}
