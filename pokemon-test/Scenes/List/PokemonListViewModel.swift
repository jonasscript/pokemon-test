//
//  PokemonListViewModel.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 11/12/23.
//

import Foundation
import Combine
import SwiftUI

class PokemonListViewModel: ObservableObject {
    
    // MARK: - Porperties
    
    private var cancellables: [AnyCancellable] = []
    private let onAppearSubject = PassthroughSubject<Void, Error>()
    private var pokemonService: ServiceType
    private var nextUrl: String?
    @Published var pokemonResponse: PokemonResponse?
    @Published var pokemonList: [PokemonModel] = []
    @Published var isLoading = false
    var request = PokemonListRequest()
    
    init(apiService: ServiceType = PokemonService()) {
        self.pokemonService = apiService
        request.queryItems = [
            URLQueryItem(name: "limit", value: "44")
        ]
        fetchPokemonList()
    }
    
    public func updateData(currentPokemon: PokemonModel? = nil) {
        guard let nextUrl = nextUrl, let currentPokemon = currentPokemon else {
            isLoading = true
            onAppearSubject.send()
            return
        }
        let maxScrollIndex = pokemonList.index(pokemonList.endIndex, offsetBy: -2)
        if maxScrollIndex == currentPokemon.id ?? 0, !isLoading {
            self.pokemonService = PokemonService(baseURL: nextUrl.absoluteUrl())
            request.queryItems = nextUrl.getQueryParams()
            isLoading = true
            onAppearSubject.send()
        }
    }
    
    private func fetchPokemonList() {
        let publisher = onAppearSubject.flatMap { _ -> AnyPublisher<PokemonResponse, Error> in
            return self.pokemonService.excecute(from: self.request)
        }
        let pokemonsStream = publisher
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(_): do {
                    self.isLoading = false
                }
                case .finished:
                    self.isLoading = false
                    break
                }
            },receiveValue: { (pokemonResponse) in
                self.isLoading = false
                self.nextUrl = pokemonResponse.next
                self.pokemonList.append(contentsOf: pokemonResponse.results)
            })
        cancellables += [
            pokemonsStream
        ]
    }
    
}
