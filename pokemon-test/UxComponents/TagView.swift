//
//  TagView.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 13/12/23.
//

import SwiftUI

struct TagView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(5)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
}

#Preview {
    TagView(text: "Homa")
}
