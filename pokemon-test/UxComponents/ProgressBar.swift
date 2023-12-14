//
//  ProgressBar.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 13/12/23.
//

import SwiftUI

struct ProgressBar: View {
    var value: Int
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 7)
                    .opacity(0.3)
                    .foregroundColor(Color.green)
                Rectangle()
                    .frame(width: min(CGFloat(self.value)/100*geometry.size.width, geometry.size.width), height: 7)
                    .foregroundColor(Color.green)
                    .animation(.linear, value: value)
            }
            .cornerRadius(100.0)
        }
        .frame(height: 7)
    }
}

#Preview {
    ProgressBar(value: 30)
}
