//
//  JokeViewController.swift
//  FirstParsingHW
//
//  Created by Roman on 08.11.2022.
//

import UIKit

class JokeViewController: UIViewController {
    
    @IBOutlet var jokeLabel: UILabel!
    @IBOutlet var setupLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJoke()
    }
    
    func fetchJoke() {
        NetworkManager.shared.fetchJoke(Joke.self, from: NetworkManager.shared.url) { [weak self] result in
            switch result {
            case .success(let data):
                if data.joke != nil {
                    self?.jokeLabel.text = data.joke
                    self?.setupLabel.text = "🙊"
                } else {
                    self?.setupLabel.text = data.setup
                    self?.jokeLabel.text = data.delivery
                }
            case .failure(let error):
                print(error)
            }
        }
     }
}

