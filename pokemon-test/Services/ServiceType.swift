//
//  ServiceType.swift
//  pokemon-test
//
//  Created by Jonathan Macias on 11/12/23.
//

import Foundation
import Combine

public enum HTTPMethod {
    
    case post
    case get
    
    var description: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
    
}

protocol ServiceType {
    
    var session: URLSession { get }
    var baseURL: String { get }
    var runTask: DispatchQueue { get }
    func excecute<Request>(from endpoint: Request) -> AnyPublisher<Request.ResponseData, Error> where Request: APIServerRequest
    
}

protocol APIServerRequest {
    
    associatedtype ResponseData: Decodable
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    func body() throws -> Data?
    
}

extension APIServerRequest {
    
    func buildRequest(baseURL: String) throws -> URLRequest {
        guard let url = URL(string: baseURL) else {
            throw APIServiceError.invalidURL
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = queryItems
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.description
        request.allHTTPHeaderFields = headers
        request.httpBody = try body()
        return request
    }
    
}

enum APIServiceError: Error {
    
    case invalidURL
    case httpError(HTTPCode)
    case parseError
    case unexpectedResponse
    
}

extension APIServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case let .httpError(statusCode): return "Unexpected HTTP status code: \(statusCode)"
        case .parseError: return "Unexpected JSON parse error"
        case .unexpectedResponse: return "Unexpected response from the server"
        }
    }
}

typealias HTTPCode = Int
typealias HTTPCodes = Range<HTTPCode>

extension HTTPCodes {
    static let success = 200 ..< 300
}
