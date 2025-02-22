//
//  FavoriteView.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import SwiftUI

struct FavoriteView: View {
    
    @StateObject var viewModel: FavoriteViewModel
    @EnvironmentObject var favoriteListHelper: FavoriteListHelper
    
    init(favoriteListHelper: FavoriteListHelper) {
        _viewModel = StateObject(wrappedValue: FavoriteViewModel(favoriteListHelper: favoriteListHelper))
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.favoriteCountries) { country in
                        NavigationLink(
                            destination: DetailView(viewModel: DetailViewModel(country: country)),
                            label: {
                                FavoriteLineView(country: country)
                            }
                        )
                    }
                }
                .padding(.top)
                .navigationBarTitle("Favorites_Page", displayMode: .inline)
            }
            .onAppear {
                viewModel.loadData()
            }
        }
    }
}
