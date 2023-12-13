//
//  ContentView.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 11/12/23.
//

import SwiftUI

struct PokemonListView: View {
    
    // MARK: - Properties
    
//    @State var pokemonList: [PokemonModel] = []
    @ObservedObject var viewModel = PokemonListViewModel()
    
    // MARK: - View
    
    var body: some View {
        NavigationStack {
            List(viewModel.pokemonList) { pokemon in
                NavigationLink(
                    destination: PokemonDetailsView(pokemon: pokemon)
                ) {
                    PokemonItemView(pokemon: pokemon)
                    .onAppear {
                        viewModel.updateData(currentPokemon: pokemon)
                    }
                }
            }
            .onAppear() {
                viewModel.updateData()
            }
        }
        .padding()
    }
    
//    func loadPokemons(with currentPokemon: PokemonModel? = nil) {
//        guard let currentPokemon = currentPokemon else {
//            return
//        }
//        print("ID DE CURRENT: \(currentPokemon.id ?? 0)")
//        if thresholdIndex == currentPokemon.id ?? 0, !viewModel.isLoading {
//            viewModel.updateData(with: nextUrl)
//        }
//    }
    
}

//#Preview {
//    PokemonListView()
//}


