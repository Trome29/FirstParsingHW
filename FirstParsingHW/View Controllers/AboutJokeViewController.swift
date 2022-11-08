//
//  AboutJokeViewController.swift
//  FirstParsingHW
//
//  Created by Roman on 08.11.2022.
//

import UIKit

class AboutJokeViewController: UIViewController {
    
    //var joke: Joke
    
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var flagsLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var category: String!
    var type: String!
    var flags: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchJoke()
    }
    
    func fetchJoke() {
        NetworkManager.shared.fetchJoke(Joke.self, from: NetworkManager.shared.url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.categoryLabel.text = data.category ?? ""
                self?.typeLabel.text = data.type ?? ""
                for value in data.flags.values {
                    if value {
                        let flags = data.flags.keys.map {$0}.joined(separator: ", \n")
                        self?.flagsLabel.text = flags
                    } else {
                        self?.flagsLabel.text = "🙊"
                    }
                }
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
     }
}
