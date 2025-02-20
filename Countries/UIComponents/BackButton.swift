//
//  BackButton.swift
//  Countries
//
//  Created by Cakir, Faik on 20.02.2025.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            Image(systemName: "arrow.backward")
            Text("Go_Back")
        }
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
