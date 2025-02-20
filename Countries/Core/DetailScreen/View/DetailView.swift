//
//  DetailView.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import SwiftUI

struct DetailView: View {
    
    var countryDetailManager = CountryDetailManager()
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
            countryDetailManager.getCountryDetail(countryCode: country.code) { detail, error  in
                countryDetail = detail?.country ?? DataStruct()
            }
        }
    }
}


