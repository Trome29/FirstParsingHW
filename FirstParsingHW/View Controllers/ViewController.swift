//
//  ViewController.swift
//  FirstParsingHW
//
//  Created by Roman on 04.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJoke()
    }
}

extension ViewController {
    
    private func fetchJoke() {
        guard let url = URL(string: "https://v2.jokeapi.dev/joke/Programming") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let joke = try decoder.decode(Joke.self, from: data)
                print(joke)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
