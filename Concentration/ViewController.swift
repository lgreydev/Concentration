//
//  ViewController.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 20.04.2021.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Instance Variables
    
    /// The variable that keeps track of the number of card flips
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    /// Shows the number of card flips
    @IBOutlet weak var flipCountLabel: UILabel!
    
    /// The array of cards that we get from the View
    @IBOutlet var сardButtons: [UIButton]!
    
    let emojs = ["👻", "🎃", "🧟‍♂️", "👾"]
    
    
    // MARK: - IBAction
    
    /// Call a function that flips the card
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let numberCard = сardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojs[numberCard], on: sender)
            print(numberCard)
        }
    }
    
    
    
    // MARK: - Methods
    
    /// Flip the card face down if emoji match
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .systemOrange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
}

