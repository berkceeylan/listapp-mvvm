//
//  NetworkManager.swift
//  ListAppMVVM
//
//  Created by Berk Ceylan on 22.02.2025.
//

import Foundation

protocol NetworkServiceProtocol {
    //MARK: - ViewModel için taşıyıcı protocol
    func fetchData<T: Codable>(from endpoint: EndPoint, completion: @escaping (Result<T, Error>) -> Void)
}
 
final class NetworkManager: NetworkServiceProtocol {
    //MARK: - Generic Api Çağrısı Burada oluşturduğum constant EndPointi ile fetch yapacağım func
    func fetchData<T: Codable>(from endpoint: EndPoint, completion: @escaping (Result<T, Error>) -> Void) {
        let request = endpoint.request()

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "Boş veri", code: -1001, userInfo: nil)))
                return
            }

            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
