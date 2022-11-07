//
//  HomeView.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var countriesService: CountriesService
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(countriesService.countryList) { country in
                        NavigationLink(
                            destination: DetailView(country: country),
                            label: {
                                HomeLineView(country: country)
                            }
                        )
                    }
                }
                .padding(.top)
                .alert("Service_Error_Title", isPresented: ($countriesService.showAlert)) {
                    Button("OK", role: .cancel) { }
                    // permissionHelper.getDeviceAccessNeededAlert()
                } message: {
                    Text("Service_Error_Body")
                }
            }
            .navigationBarTitle("Countries_Home_Page", displayMode: .inline)
        }
        
    }
}

