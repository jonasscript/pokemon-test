//
//  StatView.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 13/12/23.
//

import SwiftUI

struct StatView: View {
    var statName: String
    var value: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(statName)
                .font(.caption)
                .foregroundColor(.gray)
            ProgressBar(value: value)
        }
    }
}

#Preview {
    StatView(statName: "Nombre", value: 100)
}
