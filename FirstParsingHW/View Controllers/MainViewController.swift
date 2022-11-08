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
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let jokeVC = segue.destination as? JokeViewController else { return }
        jokeVC.fetchJoke()
    }
    
    @IBAction func getJoke() {
    }
}

