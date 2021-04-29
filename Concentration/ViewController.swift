//  Branch Main
//  ViewController.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 20.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    /// The game initialization with number of pairs of cards
    lazy var game = Concentration(numberOfPairsOfCards: сardButtons.count / 2)
    
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
    
    /// Array of emoji for cards
    var emojiChoices = ["👻", "🎃", "🧟‍♂️", "🧛🏿‍♂️", "😺", "😈"]
    var emoji = [Int: String]()
    
    
    
    // MARK: - Methods
    /// Call a function that flips the card
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = сardButtons.firstIndex(of: sender) {
//            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in сardButtons.indices {
            let button = сardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor
                    = card.isMatched ? UIColor.black.withAlphaComponent(0.7) : UIColor.systemOrange
            }
        }
    }
    
    
    /// By identifier card, select from an array of emoji and place it on the card.
    /// - Parameter card: current card
    /// - Returns: return emoji
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int.random(in: 0..<emojiChoices.count)
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    

    
}

