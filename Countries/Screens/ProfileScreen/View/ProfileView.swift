//
//  ProfileView.swift
//  Countries
//
//  Created by Cakir, Faik on 22.02.2025.
//

import SwiftUI

struct ProfileView: View {
    
    private var countryDetailManager: CountryDetailManagerProtocol = CountryDetailManager()
    @StateObject private var locationManager = LocationManager()
    @State var country: DataStruct = DataStruct()
    
    var body: some View {
        VStack(spacing: 16) {
            Text(country.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                
            Divider()
            
            ProfileInfoRow(title: "Capital", value: country.capital)
            ProfileInfoRow(title: "Country Code", value: country.code)
            ProfileInfoRow(title: "Calling Code", value: country.callingCode)
            ProfileInfoRow(title: "Currency", value: country.currencyCodes.joined(separator: ", "))
            
            Link("More Info", destination: URL(string: "https://www.wikidata.org/wiki/\(country.wikiDataID)")!)
                .font(.headline)
                .foregroundColor(.blue)
        }
        .padding()
        .navigationTitle(country.name)
        .onReceive(locationManager.$countryCode) { newCode in
            if let newCode = newCode {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    countryDetailManager.getCountryDetail(countryCode: newCode) { countryDetail, error in
                            self.country = countryDetail?.country ?? DataStruct()
                    }
                }
            }
        }
    }
}
