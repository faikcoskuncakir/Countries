//
//  HomeLineViewModel.swift
//  Countries
//
//  Created by Cakir, Faik on 22.02.2025.
//

import SwiftUI
import Combine

class HomeLineViewModel: ObservableObject {
    @Published var isFavorite: Bool
    let country: Country
    private var favoriteListHelper: FavoriteListHelper
    private var cancellables: Set<AnyCancellable> = []

    init(country: Country, favoriteListHelper: FavoriteListHelper) {
        self.country = country
        self.favoriteListHelper = favoriteListHelper
        self.isFavorite = favoriteListHelper.isFavorite(country: country)

        favoriteListHelper.$favoriteList
            .sink { [weak self] _ in
                self?.isFavorite = self?.favoriteListHelper.isFavorite(country: country) ?? false
            }
            .store(in: &cancellables)
    }

    func toggleFavorite() {
        if isFavorite {
            favoriteListHelper.removeFavorite(country: country)
        } else {
            favoriteListHelper.addFavorite(country: country)
        }
    }
}
