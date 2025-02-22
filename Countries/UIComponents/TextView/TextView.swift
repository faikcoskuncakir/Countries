//
//  TextView.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import SwiftUI

struct TextView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.openURL) var openURL
    @ObservedObject var viewModel: TextViewModel
    
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
                if let url = viewModel.getWikiURL() {
                    openURL(url)
                }
            }
        }
    }
}

