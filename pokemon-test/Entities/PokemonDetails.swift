// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemonModel = try? JSONDecoder().decode(PokemonModel.self, from: jsonData)

import Foundation

// MARK: - PokemonModel
struct PokemonDetail: Codable {
    let types: [PokemonType]?
    let weight: Int?
    let sprites: Sprites?
    let abilities: [PokemonAbility]
    let moves: [PokemonMove]
}

// MARK: - AbilityElement
struct PokemonAbility: Codable {
    let ability: MoveClass
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - MoveClass
struct MoveClass: Codable {
    let name: String?
    let url: String?
}

// MARK: - Move
struct PokemonMove: Codable, Identifiable {
    var id = UUID()
    let move: MoveClass?
    
    enum CodingKeys: String, CodingKey {
        case move = "move"
    }
}

// MARK: - Sprites
struct Sprites: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

// MARK: - TypeElement
struct PokemonType: Codable {
    let slot: Int?
    let type: MoveClass?
    
    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }
}
