//
//  ContentView.swift
//  Countries
//
//  Created by Faik on 4.11.2022.
//

import SwiftUI

struct ContentView: View {

    @StateObject var favoriteListHelper: FavoriteListHelper = FavoriteListHelper()

    init() {
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            UITabBar.appearance().backgroundColor = UIColor.systemGray6
        }
    }


    var body: some View {
        TabView() {
            HomeView()
                .tabItem {
                Image(systemName: "house")
                Text("Countries_Tab_View")
            }

            FavoriteView()
                .tabItem {
                Image(systemName: "heart")
                Text("Favorites_Tab_View")
            }
        }
        .environmentObject(favoriteListHelper)

    }
}

