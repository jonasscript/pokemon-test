//
//  PokemonItemView.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 11/12/23.
//

import SwiftUI

struct PokemonItemView: View {
        
    // MARK: - Properties
    
    let pokemon: PokemonModel
    
    // MARK: - View
    
    var body: some View {
        HStack {
            AsyncImage(
                url: pokemon.imageUrl
            ) { image in
                image.resizable()
            } placeholder: {
                Image(uiImage: .checkmark)
                    .resizable()
                    .padding()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 45)
            .background(Color.gray.opacity(0.1))
            .clipShape(Circle())
            Text(pokemon.name.capitalized)
                .fontWeight(.medium)
            Spacer()
        }
    }
}

struct PokemonItemView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonItemView(
            pokemon: PokemonModel(
                name: "Pikachu",
                url: "https://pokeapi.co/api/v2/pokemon/45/"
            )
        )
    }
}
