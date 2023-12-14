//
//  CardView.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 14/12/23.
//

import SwiftUI

struct CardView<Content: View>: View {
    let content: Content
    var shadowColor: Color
    var backgroundColor: Color
    
    init(
        shadowRadius: CGFloat = 5,
        shadowColor: Color = Color.gray.opacity(0.2),
        backgroundColor: Color = Color.gray.opacity(0.1),
        @ViewBuilder content: () -> Content
    ) {
        self.shadowColor = shadowColor
        self.backgroundColor = backgroundColor
        self.content = content()
    }

    var body: some View {
        VStack {
            content
                .padding() // Agrega el padding al contenido de la tarjeta.
        }
        .background(backgroundColor)
        .cornerRadius(25)
        .shadow(color: shadowColor, radius: 25, x: 0, y: 0)
        .padding()
    }
}

#Preview {
    CardView {
        EmptyView()
    }
}
