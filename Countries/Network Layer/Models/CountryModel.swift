//
//  CountryModel.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import Foundation

struct CountryModel: Codable { // JSON model of a specific country
    var country: DataStruct

    enum CodingKeys: String, CodingKey {
        case country = "data"
    }
}

struct DataStruct: Codable {
    var code: String = ""
    var capital: String = ""
    var callingCode: String = ""
    var flagImageURI: String = ""
    var name: String = ""
    var wikiDataID: String = ""
    var currencyCodes: [String] = []
 
    enum CodingKeys: String, CodingKey {
        case code, capital, callingCode, currencyCodes, name
        case flagImageURI = "flagImageUri"
        case wikiDataID = "wikiDataId"
    }
    
    init() {
        self.capital = ""
        self.code = ""
        self.callingCode = ""
        self.flagImageURI = ""
        self.name = ""
        self.wikiDataID = ""
        self.currencyCodes = []
    }
}
