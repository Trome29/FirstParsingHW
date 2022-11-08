//
//  ViewController.swift
//  FirstParsingHW
//
//  Created by Roman on 04.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "showJoke" {
//            guard let jokeVC = segue.destination as? JokeViewController else { return }
//            jokeVC.fetchJoke()
//        }
//    }
    
    @IBAction func getJoke() {
//        fetchJoke()
    }
    
}
// MARK: - Networking
//extension MainViewController {
//    func fetchJoke() {
//        NetworkManager.shared.fetchJoke(Joke.self, from: NetworkManager.shared.url) { result in
//            switch result {
//            case .success(let data):
//                print(data)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}
