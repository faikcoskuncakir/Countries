//
//  TextViewModel.swift
//  Countries
//
//  Created by Cakir, Faik on 22.02.2025.
//

import Foundation

class TextViewModel: ObservableObject {
    let countryDetail: DataStruct
    private let wikiBaseURL = "https://www.wikidata.org/wiki/"
    
    init(countryDetail: DataStruct) {
        self.countryDetail = countryDetail
    }
    
    func getWikiURL() -> URL? {
        return URL(string: wikiBaseURL + countryDetail.wikiDataID)
    }
}
