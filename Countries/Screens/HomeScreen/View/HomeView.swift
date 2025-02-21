//
//  HomeView.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(homeViewModel.countries) { country in
                        NavigationLink(
                            destination: DetailView(country: country),
                            label: {
                                HomeLineView(country: country)
                            }
                        )
                    }
                }
                .padding(.top)
                .alert("Service_Error_Title", isPresented: ($homeViewModel.showAlert)) {
                    Button("OK", role: .cancel) { }
                    // permissionHelper.getDeviceAccessNeededAlert()
                } message: {
                    Text("Service_Error_Body")
                }
            }
            .navigationBarTitle("Countries_Home_Page", displayMode: .inline)
            .onAppear{
                homeViewModel.fetchCountries()
            }
        }
        
    }
}

