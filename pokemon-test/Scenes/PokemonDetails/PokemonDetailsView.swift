//
//  PokemonDetails.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 13/12/23.
//

import SwiftUI

struct PokemonDetailsView: View {
    
    // MARK: - Properties
    
    let pokemon: PokemonModel
    @ObservedObject var viewModel: PokemonDetailViewModel
    
    init(pokemon: PokemonModel) {
        self.pokemon = pokemon
        self.viewModel = PokemonDetailViewModel()
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CardView {
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("# \(pokemon.id?.description ?? "")")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("\(pokemon.name)")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                            HStack {
                                ForEach(viewModel.pokemonDetail?.types ?? [], id: \.slot) { pokemonType in
                                    TagView(text: pokemonType.type?.name ?? "")
                                }
                            }
                        }
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(viewModel.pokemonDetail?.abilities ?? [], id: \.slot) { abilitie in
                                    StatView(statName: abilitie.ability.name ?? "", value: 50)
                                }
                            }
                            Spacer()
                            AsyncImage(
                                url: pokemon.imageUrl
                            ) { image in
                                image.resizable()
                                    .frame(width: 150, height: 150)
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                            } placeholder: {
                                EmptyView()
                            }
                        }
                    }
                }
                CardView(content: {
                    VStack(alignment: .center, spacing: 0) {
                        Text("Información")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .padding()
                        PhycisInfoView(height: "70 cm", weight: "\(viewModel.pokemonDetail?.weight?.description ?? "") Kg")
                    }
                })
                CardView {
                    MoveListView(activeMovements: viewModel.pokemonDetail?.activeMovements ?? [])
                }
                if let spites = viewModel.pokemonDetail?.sprites {
                    SpritesView(sprites: spites)
                } else {
                    EmptyView()
                }
            }
        }
        .onAppear() {
            viewModel.updateDetails(currentPokemon: pokemon)
        }
        .navigationTitle(pokemon.name)
    }
}

struct MoveListView: View {
    var activeMovements: [MoveElement]
    var body: some View {
        VStack {
            HStack {
                Text("Movimientos")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                Spacer()
                Button(action: {}) {
                    Text("Ver todos")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(activeMovements, id: \.id) { pokemonType in
                        TagView(text: pokemonType.move?.name ?? "")
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    PokemonDetailsView(pokemon: PokemonModel(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"))
}
