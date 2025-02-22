//
//  FavoriteLineView.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import SwiftUI

struct FavoriteLineView: View {
    
    @ObservedObject var viewModel: FavoriteLineViewModel
    @EnvironmentObject var favoriteListHelper: FavoriteListHelper
    
    init(country: Country, favoriteListHelper: FavoriteListHelper) {
        _viewModel = ObservedObject(wrappedValue: FavoriteLineViewModel(country: country, favoriteListHelper: favoriteListHelper))
    }

    var body: some View {
        HStack {
            Text(viewModel.country.name)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "star.fill")
                .font(.title)
                .foregroundColor(.yellow)
                .onTapGesture {
                    viewModel.removeFavorite()
                }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.width / 7)
        .background(Color.gray)
        .cornerRadius(20)
    }
}
