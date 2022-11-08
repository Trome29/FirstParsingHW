//
//  AboutJokeViewController.swift
//  FirstParsingHW
//
//  Created by Roman on 08.11.2022.
//

import UIKit

class AboutJokeViewController: UIViewController {
    @IBOutlet var dataLabel: [UILabel]!
    
    var joke: Joke!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        categoryLabel.text = joke?.category
//        typeLabel.text = joke?.type
        displayInfo(in: dataLabel)
        
    }

    func displayInfo(in labels: [UILabel]) {
        labels.forEach { label in
            switch label.tag {
            case 0:
                label.text = joke.category
            case 1:
                label.text = joke.type
            case 2:
                label.text = String(joke.flags.nsfw)
            case 3:
                label.text = String(joke.flags.religious)
            case 4:
                label.text = String(joke.flags.political)
            case 5:
                label.text = String(joke.flags.racist)
            case 6:
                label.text = String(joke.flags.sexist)
            default:
                label.text = String(joke.flags.explicit)
            }
        }
    }
}
