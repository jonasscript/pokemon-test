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
        VStack {
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
            .frame(width: 120)
            HStack {
                Text("# \(pokemon.id?.description ?? "")")
                Text("Nombre: \(pokemon.name)")
            }
            Text("Peso: \(viewModel.pokemonDetail?.weight ?? 0)")
            Text("Habilidades:")
            VStack {
                ForEach(viewModel.pokemonDetail?.types ?? [], id: \.slot) { pokemonType in
                    Text(pokemonType.type?.name ?? "")
                }
            }
            Text("Espíritus: ")
            ScrollView(.horizontal) {
                HStack {
                    AsyncImage(
                        url: URL(string: viewModel.pokemonDetail?.sprites?.backDefault ?? "")
                    ) { image in
                        image.resizable()
                    } placeholder: {
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                    AsyncImage(
                        url: URL(string: viewModel.pokemonDetail?.sprites?.backFemale ?? "")
                    ) { image in
                        image.resizable()
                    } placeholder: {
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                    AsyncImage(
                        url: URL(string: viewModel.pokemonDetail?.sprites?.backShiny ?? "")
                    ) { image in
                        image.resizable()
                    } placeholder: {
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                    AsyncImage(
                        url: URL(string: viewModel.pokemonDetail?.sprites?.backShinyFemale ?? "")
                    ) { image in
                        image.resizable()
                    } placeholder: {
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                    AsyncImage(
                        url: URL(string: viewModel.pokemonDetail?.sprites?.frontDefault ?? "")
                    ) { image in
                        image.resizable()
                    } placeholder: {
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                    AsyncImage(
                        url: URL(string: viewModel.pokemonDetail?.sprites?.frontFemale ?? "")
                    ) { image in
                        image.resizable()
                    } placeholder: {
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                    AsyncImage(
                        url: URL(string: viewModel.pokemonDetail?.sprites?.frontShiny ?? "")
                    ) { image in
                        image.resizable()
                    } placeholder: {
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                    AsyncImage(
                        url: URL(string: viewModel.pokemonDetail?.sprites?.frontShinyFemale ?? "")
                    ) { image in
                        image.resizable()
                    } placeholder: {
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                }
            }
            Text("Movimientos: ")
            HStack {
                ForEach(viewModel.pokemonDetail?.moves ?? [], id: \.id) { pokemonType in
                    Text(pokemonType.move?.name ?? "")
                }
            }
        }
        .onAppear() {
            viewModel.updateDetails(currentPokemon: pokemon)
        }
    }
}
//
//#Preview {
//    PokemonDetails(pokemon: PokemonModel(name: "", url: ""))
//}
