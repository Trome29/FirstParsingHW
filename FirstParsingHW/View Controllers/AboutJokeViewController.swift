//
//  AboutJokeViewController.swift
//  FirstParsingHW
//
//  Created by Roman on 08.11.2022.
//

import UIKit

class AboutJokeViewController: UIViewController {
    
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var flagsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJoke()
    }
    
    func fetchJoke() {
        NetworkManager.shared.fetchJoke(Joke.self, from: NetworkManager.shared.url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.categoryLabel.text = data.category ?? ""
                self?.typeLabel.text = data.type ?? ""
// подумать как реализовать только true
                let flags = data.flags.keys.map {$0}.joined(separator: ", ")
                self?.flagsLabel.text = flags
            case .failure(let error):
                print(error)
            }
        }
     }
}
