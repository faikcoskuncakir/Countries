//
//  PictureView.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import SwiftUI

struct PictureView: View {
    
    var image: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.width / 1.1)
        }
    }
}
