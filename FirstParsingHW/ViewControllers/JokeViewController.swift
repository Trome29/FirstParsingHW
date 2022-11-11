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
        fetchJoke()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutJokeVC = segue.destination as? AboutJokeViewController else { return }
        aboutJokeVC.joke = joke
    }
    
    // MARK: - Public methods
    private func fetchJoke() {
        activityIndicator.stopAnimating()
        NetworkManager.shared.fetchJoke(form: Link.url.rawValue) { [weak self] result in
            switch result {
            case .success(let joke):
                self?.joke = joke
                if self?.joke.type == "single" {
                    self?.jokeLabel.text = self?.joke.joke
                    self?.setupLabel.text = ""
                } else {
                    self?.jokeLabel.text = self?.joke.delivery
                    self?.setupLabel.text = self?.joke.setup
                }
            case .failure(let error):
                print(error.localizedDescription)
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

