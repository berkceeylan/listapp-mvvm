//
//  NetworkConstant.swift
//  ListAppMVVM
//
//  Created by Berk Ceylan on 22.02.2025.
//

import Foundation

protocol EndPointProtocol {
    var baseURL: String { get }
    var apiKey: String { get }
    var genURL: String { get }
    var method: HTTPMethod { get }
}
enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
}

enum EndPoint {
    case users
}

extension EndPoint: EndPointProtocol {
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    var genURL: String {
        //MARK: - URL istekleri ilerki zamanda farklı olabileceği için /photos , /comments gibi switch kullanımı uyguladım istenildiği zaman eklenebilir
        switch self {
        case .users:
            return "users"
        }
    }
    var apiKey: String {
        //MARK: - Varsa ApiKey
        ""
    }
    
    var method: HTTPMethod {
        //MARK: - URL istekleri ilerki zamanda farklı olabileceği için /photos , /comments gibi switch kullanımı uyguladım istenildiği zaman eklenebilir
        switch self {
        case .users:
            return .get
        }
    }
    func usersFetchDataURL() -> String {
        //MARK: - Istek atılcak URL
        return "\(baseURL)\(genURL)\(apiKey)"
    }
    func request() -> URLRequest {
        //MARK: - Request
        guard let apiURL = URLComponents(string: usersFetchDataURL()) else {
            fatalError()
        }
        guard let url = apiURL.url else {
            fatalError()
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
        
        
    }
}
