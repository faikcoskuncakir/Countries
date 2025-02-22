//
//  ProfileView.swift
//  Countries
//
//  Created by Cakir, Faik on 22.02.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text(viewModel.country.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                
            Divider()
            
            ProfileInfoRow(title: "Capital", value: viewModel.country.capital)
            ProfileInfoRow(title: "Country Code", value: viewModel.country.code)
            ProfileInfoRow(title: "Calling Code", value: viewModel.country.callingCode)
            ProfileInfoRow(title: "Currency", value: viewModel.country.currencyCodes.joined(separator: ", "))
            
            Link("More Info", destination: URL(string: "https://www.wikidata.org/wiki/\(viewModel.country.wikiDataID)")!)
                .font(.headline)
                .foregroundColor(.blue)
        }
        .padding()
        .navigationTitle(viewModel.country.name)
    }
}

