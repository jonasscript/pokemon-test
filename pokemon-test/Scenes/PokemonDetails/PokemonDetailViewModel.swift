//
//  PokemonDetailViewModel.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 13/12/23.
//

import Foundation
import Combine

class PokemonDetailViewModel: ObservableObject {
    
    var request = PokemonDetailRequest()
    @Published var pokemonDetail: PokemonDetail?
    private var pokemonService: ServiceType
    private var cancellables: [AnyCancellable] = []
    private let onAppearSubject = PassthroughSubject<Void, Error>()
    @Published var isLoading = false
    
    init() {
        pokemonService = PokemonService()
    }
    
    func updateDetails(currentPokemon: PokemonModel) {
        pokemonService = PokemonService(baseURL: currentPokemon.url)
        fetchPokemonDetail()
        onAppearSubject.send()
    }
    
    private func fetchPokemonDetail() {
        let publisher = onAppearSubject.flatMap { _ -> AnyPublisher<PokemonDetail, Error> in
            return self.pokemonService.excecute(from: self.request)
        }
        let pokemonsStream = publisher
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error): do {
                    self.isLoading = false
                }
                case .finished:
                    self.isLoading = false
                    break
                }
            },receiveValue: { (pokemonDetailResponse) in
                self.isLoading = false
                self.pokemonDetail = pokemonDetailResponse
            })
        cancellables += [
            pokemonsStream
        ]
    }
    
}
