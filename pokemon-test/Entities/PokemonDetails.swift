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
    let moves: [MoveElement]
    
    enum CodingKeys: String, CodingKey {
        case types, weight, sprites, abilities, moves
    }
    
    var activeMovements: [MoveElement] {
        let activeMoves = moves.filter { moveElement in
            return !moveElement.activeVersionGroup.isEmpty
        }
        if activeMoves.count > 6 {
            return Array(activeMoves.prefix(4))
        } else {
            return activeMoves
        }
    }
}

// MARK: - AbilityElement
struct PokemonAbility: Codable {
    let ability: TypeClass
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - MoveClass
struct TypeClass: Codable {
    let name: String?
    let url: String?
}

// MARK: - Move
struct PokemonMove: Codable, Identifiable {
    var id = UUID()
    let move: TypeClass?
    
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
    let type: TypeClass?
    
    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }
}

struct MoveElement: Codable {
    var id = UUID()
    let move: MoveMove?
    let versionGroupDetails: [VersionGroupDetail]?
    var activeVersionGroup: [VersionGroupDetail] {
        guard let versionGroupDetails = versionGroupDetails else {
            return []
        }
        return versionGroupDetails.filter { $0.levelLearnedAt ?? 0 > 0 }
    }
    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

struct MoveMove: Codable {
    let name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case name, url
    }
}


struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int?
    let moveLearnMethod, versionGroup: TypeClass?

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}
