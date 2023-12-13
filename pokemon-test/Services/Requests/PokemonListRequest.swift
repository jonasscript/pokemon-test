//
//  PokemonListRequest.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 11/12/23.
//

import Foundation

struct PokemonListRequest: APIServerRequest {
    
    typealias ResponseData = PokemonResponse
    var method: String { return "GET" }
    var headers: [String: String]? { return ["Content-Type": "application/json"] }
    var queryItems: [URLQueryItem]?
    func body() throws -> Data? {
        return Data()
    }
    
}
