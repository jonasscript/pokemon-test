//
//  SpritesView.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 14/12/23.
//

import SwiftUI

struct SpritesView: View {
    var sprites: Sprites
    var body: some View {
        CardView {
            VStack {
                Text("Espíritus")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                ScrollView(.horizontal) {
                    HStack {
                        AsyncImage(
                            url: URL(string: sprites.backDefault ?? "")
                        ) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                        } placeholder: {
                        }
                        AsyncImage(
                            url: URL(string: sprites.backFemale ?? "")
                        ) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                        } placeholder: {
                        }
                        AsyncImage(
                            url: URL(string: sprites.backShiny ?? "")
                        ) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                        } placeholder: {
                        }
                        AsyncImage(
                            url: URL(string: sprites.backShinyFemale ?? "")
                        ) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                        } placeholder: {
                        }
                        AsyncImage(
                            url: URL(string: sprites.frontDefault ?? "")
                        ) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                        } placeholder: {
                        }
                        AsyncImage(
                            url: URL(string: sprites.frontFemale ?? "")
                        ) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                        } placeholder: {
                        }
                        AsyncImage(
                            url: URL(string: sprites.frontShiny ?? "")
                        ) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                        } placeholder: {
                        }
                        AsyncImage(
                            url: URL(string: sprites.frontShinyFemale ?? "")
                        ) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                        } placeholder: {
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    SpritesView()
//}
