//
//  NetworkManager.swift
//  FirstParsingHW
//
//  Created by Roman on 08.11.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    let url = "https://v2.jokeapi.dev/joke/Any" //change
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchJoke(form url: String, completion: @escaping(Result<Joke, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let joke = Joke.getJoke(from: value)
                    completion(.success(joke))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
