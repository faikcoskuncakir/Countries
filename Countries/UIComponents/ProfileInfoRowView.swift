//
//  ProfileInfoRowView.swift
//  Countries
//
//  Created by Cakir, Faik on 22.02.2025.
//

import SwiftUI

struct ProfileInfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title + ":")
                .fontWeight(.semibold)
            Spacer()
            Text(value)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}
