//
//  PokemonDetailRequest.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 13/12/23.
//

import Foundation

struct PokemonDetailRequest: APIServerRequest {
    
    typealias ResponseData = PokemonDetail
    var method: String { return "GET" }
    var headers: [String: String]? { return ["Content-Type": "application/json"] }
    var queryItems: [URLQueryItem]?
    func body() throws -> Data? {
        return Data()
    }
    
}
