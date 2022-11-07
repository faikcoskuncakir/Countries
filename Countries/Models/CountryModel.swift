//
//  CountryModel.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import Foundation

struct CountryModel: Codable { // JSON model of a specific country
    let country: DataStruct

    enum CodingKeys: String, CodingKey {
        case country = "data"
    }
}

struct DataStruct: Codable {
    let code: String
    let flagImageURI: String
    let name: String
    let wikiDataID: String

    enum CodingKeys: String, CodingKey {
        case code, name
        case flagImageURI = "flagImageUri"
        case wikiDataID = "wikiDataId"
    }
}
