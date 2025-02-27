//
//  WebViewScreen.swift
//  Countries
//
//  Created by Cakir, Faik on 27.02.2025.
//

import SwiftUI

struct WebViewScreen: View {
    let url: URL
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding()
                }
            }
            WebView(url: url)
        }
    }
}
