//
//  Endpoints.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import Foundation

enum Endpoints: String {
    case countries
    
    var urlString: String {
        let baseURL = "https://wft-geo-db.p.rapidapi.com/v1/geo/"
        switch self {
        case .countries:
            return "\(baseURL)countries/"
        }
    }
}
