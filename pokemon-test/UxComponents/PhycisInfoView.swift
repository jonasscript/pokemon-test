//
//  PhycisInfoView.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 14/12/23.
//

import SwiftUI

struct PhycisInfoView: View {
    var height: String
    var weight: String
    var body: some View {
        HStack {
            VStack {
                Text("Height")
                    .font(.caption)
                Text(height)
                    .fontWeight(.bold)
            }
            Spacer()
            VStack {
                Text("Weight")
                    .font(.caption)
                Text(weight)
                    .fontWeight(.bold)
            }
        }
        .padding()
    }
}

#Preview {
    PhycisInfoView(height: "120cm", weight: "50lbs")
}
