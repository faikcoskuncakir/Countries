//
//  FavoriteViewModel.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import Foundation
import SwiftUI

struct FavoriteLineView: View {
    
    @State var country: Country
    @EnvironmentObject var favoriteListHelper: FavoriteListHelper
    var favoriteListStorage = FavoriteListStorage()
    
    var body: some View {
        
        HStack {
            Text(country.name)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "star.fill")
                .font(.title)
                .foregroundColor(.yellow)
                .onTapGesture {
                    
                    favoriteListHelper.removeFavorite(country: country)
                }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.width / 7)
        .background(Color.gray)
        .cornerRadius(20)
    }
    
}
