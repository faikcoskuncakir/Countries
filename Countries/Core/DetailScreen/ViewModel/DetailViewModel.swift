//
//  DetailViewModel.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import Foundation
import SwiftUI

struct BackButton: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            Image(systemName: "arrow.backward")
            Text("Go_Back")
        }
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct StarButton: View {
    
    var country: Country
    @EnvironmentObject var favoriteListHelper: FavoriteListHelper
    
    var body: some View {
        
        Image(systemName: "star.fill")
            .font(.title2)
            .padding(.trailing, 2)
            .foregroundColor(favoriteListHelper.isFavorite(country: country) ? .yellow : .black)
            .onTapGesture {
                if favoriteListHelper.isFavorite(country: country) {
                    favoriteListHelper.removeFavorite(country: country)
                } else {
                    favoriteListHelper.addFavorite(country: country)
                }
            }
    }
}

struct PictureView: View {
    
    var image: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.width / 1.1)
        }
    }
}

struct TextView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.openURL) var openURL
    var countryDetail: DataStruct
    let wikiBaseURL = "https://www.wikidata.org/wiki/"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Country_Code: \(countryDetail.code)")
                .padding(.bottom, 3)
            
            HStack {
                Text("For_More_Information")
                    .font(.subheadline)
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
                    .foregroundColor(.white)
                Image(systemName: "arrow.forward")
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 9)
            .background(Color.blue)
            .onTapGesture {
                // Open the URL for wikidata with more information about the country
                openURL(URL(string: wikiBaseURL + (countryDetail.wikiDataID))!)
            }
        }
    }
}
