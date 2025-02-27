//
//  DetailView.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var favoriteListHelper: FavoriteListHelper
    @StateObject private var viewModel: DetailViewModel

    init(viewModel: DetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            PictureView(image: viewModel.countryDetail.flagImageURI.image(code: viewModel.countryDetail.code))
            TextView(viewModel: TextViewModel(countryDetail: viewModel.countryDetail))
            Spacer()
        }
        .padding(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(viewModel.countryDetail.name, displayMode: .inline)
        .navigationBarItems(leading: BackButton(), trailing: StarButton(viewModel: StarButtonViewModel(country: viewModel.country, favoriteListHelper: favoriteListHelper)))
        .onAppear {
            viewModel.fetchCountryDetail()
        }
    }
}
