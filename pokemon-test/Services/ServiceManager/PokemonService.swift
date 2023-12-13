//
//  PokemonService.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 11/12/23.
//

import Foundation
import Combine

final class PokemonService: ServiceType {

    internal let baseURL: String
    internal let session: URLSession = URLSession.shared
    internal let runTask: DispatchQueue = DispatchQueue.main

    init(baseURL: String =  "https://pokeapi.co/api/v2/pokemon") {
        self.baseURL = baseURL
    }
 
    func excecute<Request>(from endpoint: Request) -> AnyPublisher<Request.ResponseData, Error> where Request: APIServerRequest {
        do {
            let request = try endpoint.buildRequest(baseURL: baseURL)
            return session.dataTaskPublisher(for: request)
                .tryMap {
                    guard let code = ($0.response as? HTTPURLResponse)?.statusCode else {
                        throw APIServiceError.unexpectedResponse
                    }
                    guard HTTPCodes.success.contains(code) else {
                        throw APIServiceError.httpError(code)
                    }
                    return $0.data  // Pass data to downstream publishers
                }
                .decode(type: Request.ResponseData.self, decoder: JSONDecoder())
                .mapError {_ in APIServiceError.parseError}
                .receive(on: self.runTask)
                .eraseToAnyPublisher()
        } catch let error {
            return Fail<Request.ResponseData, Error>(error: error).eraseToAnyPublisher()
        }
    }
    
}
