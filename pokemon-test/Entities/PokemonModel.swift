//
//  PokemonModel.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 11/12/23.
//

import Foundation

struct PokemonResponse: Decodable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [PokemonModel]
}

struct PokemonModel: Identifiable, Decodable, Equatable {
    
    let name: String
    let url: String
    
    var id: Int? {
        return Int(url.split(separator: "/").last?.description ?? "0")
    }
    
    var imageUrl: URL? {
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id ?? 0).png")
    }
}
