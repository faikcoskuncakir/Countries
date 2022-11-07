//
//  DetailView.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import SwiftUI

struct DetailView: View {
    
    var countryService = CountryService()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var country: Country
    @State var countryDetail: DataStruct = DataStruct(code: "", flagImageURI: "", name: "", wikiDataID: "")
    
    var body: some View {
        VStack(alignment: .leading) {
            
            PictureView(image: countryDetail.flagImageURI.image(code: countryDetail.code))
            TextView(countryDetail: countryDetail)
            Spacer()
            
        }
        .padding(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(countryDetail.name, displayMode: .inline)
        .navigationBarItems(leading: BackButton(), trailing: StarButton(country: country))
        .onAppear() {
            countryService.getCountryDetail(code: country.code) { detail in
                countryDetail = detail.country
            }
        }
    }
}


