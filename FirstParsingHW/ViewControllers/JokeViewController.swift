//
//  JokeViewController.swift
//  FirstParsingHW
//
//  Created by Roman on 08.11.2022.
//

import UIKit

class JokeViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var jokeLabel: UILabel!
    @IBOutlet var setupLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Pivate properties
    private var joke: Joke!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutJokeVC = segue.destination as? AboutJokeViewController else { return }
        aboutJokeVC.joke = joke
    }
    
    // MARK: - Public methods
    func fetchJoke() {
        NetworkManager.shared.fetchJoke(Joke.self, from: NetworkManager.shared.url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.joke = data
                if data.joke != nil {
                    self?.jokeLabel.text = self?.joke.joke
                    self?.setupLabel.text = "🙉"
                } else {
                    self?.setupLabel.text = self?.joke.setup
                    self?.jokeLabel.text = self?.joke.delivery
                }
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
     }
    
    // MARK: - IBActions
    @IBAction func getJoke() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchJoke()
    }
}

