//
//  TextView.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import SwiftUI

struct TextView: View {
    @ObservedObject var viewModel: TextViewModel
    @State private var showWebView = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Country_Code: \(viewModel.countryDetail.code)")
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
                showWebView = true
            }
        }
        .sheet(isPresented: $showWebView) {
            WebView(url: viewModel.getWikiURL()!)
        }
    }
}


