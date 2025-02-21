//
//  DetailView.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject private var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            PictureView(image: viewModel.countryDetail.flagImageURI.image(code: viewModel.countryDetail.code))
            TextView(countryDetail: viewModel.countryDetail)
            Spacer()
        }
        .padding(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(viewModel.countryDetail.name, displayMode: .inline)
        .navigationBarItems(leading: BackButton(), trailing: StarButton(country: viewModel.country))
        .onAppear() {
            viewModel.fetchCountryDetail()
        }
    }
}
