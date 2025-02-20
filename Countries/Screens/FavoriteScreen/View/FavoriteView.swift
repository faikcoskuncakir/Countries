//
//  FavoriteView.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var favoriteListHelper: FavoriteListHelper
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(favoriteListHelper.favoriteList) { country in
                        NavigationLink(
                            destination: DetailView(country: country),
                            label: {
                                FavoriteLineView(country: country)
                            }
                        )
                    }
                }
                .padding(.top)
                .navigationBarTitle("Favorites_Page", displayMode: .inline)
            }
        }
    }
}

