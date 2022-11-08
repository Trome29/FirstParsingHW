//
//  NetworkManager.swift
//  FirstParsingHW
//
//  Created by Roman on 08.11.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    let url = "https://v2.jokeapi.dev/joke/Programming"
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchJoke<T: Decodable>(_ type: T.Type, from url: String?, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let joke = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(joke))
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
