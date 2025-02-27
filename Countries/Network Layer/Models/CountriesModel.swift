//
//  CountryModel.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import Foundation

struct CountriesModel: Codable {
    let data: [Country]
}

struct Country: Codable, Identifiable, Equatable {
    let code: String
    let currencyCodes: [String]
    let name, wikiDataID: String
    var id = UUID()
    
    enum CodingKeys: String, CodingKey {
        case code, currencyCodes, name
        case wikiDataID = "wikiDataId"
    }
    
    static func ==(lhs: Country, rhs: Country) -> Bool {
        return lhs.code == rhs.code
    }
    
    init(code: String = "", currencyCodes: [String] = [], name: String = "", wikiDataID: String = "") {
        self.code = code
        self.currencyCodes = currencyCodes
        self.name = name
        self.wikiDataID = wikiDataID
        self.id = UUID()
    }
}




