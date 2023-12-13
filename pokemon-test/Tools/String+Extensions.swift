//
//  URL+Extensions.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 12/12/23.
//

import Foundation

extension String {
    
    func absoluteUrl() -> String {
        guard let url = URL(string: self) else {
            return self
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.query = nil
        guard let baseUrl = components?.url?.absoluteString else {
            return self
        }
        return baseUrl
    }
    
    func getQueryParams() -> [URLQueryItem]? {
        if let url = URL(string: self), let components = URLComponents(url: url, resolvingAgainstBaseURL: true), let queryItems = components.queryItems {
            return queryItems
        } else {
            return nil
        }
    }
    
}
