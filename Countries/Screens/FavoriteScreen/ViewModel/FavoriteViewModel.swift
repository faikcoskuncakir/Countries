//
//  FavoriteViewModel.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import SwiftUI
import Combine

class FavoriteViewModel: ObservableObject {
    
    private var favoriteListHelper: FavoriteListHelper
    @Published var favoriteCountries: [Country] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init(favoriteListHelper: FavoriteListHelper) {
        self.favoriteListHelper = favoriteListHelper
        self.favoriteListHelper.$favoriteList
            .sink { [weak self] updatedList in
                self?.favoriteCountries = updatedList
            }
            .store(in: &cancellables)
    }
    
    func updateFavoriteCountries() {
        self.favoriteCountries = favoriteListHelper.favoriteList
    }
    
    func loadData() {
        updateFavoriteCountries()
    }
}
