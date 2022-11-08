//
//  ViewController.swift
//  FirstParsingHW
//
//  Created by Roman on 04.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        let topVC = navigationVC.topViewController
        guard let jokeVC = topVC as? JokeViewController else {
            return
        }
        jokeVC.fetchJoke()
    }
}

