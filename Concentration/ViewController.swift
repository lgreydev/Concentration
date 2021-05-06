//  Branch main
//  ViewController.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 20.04.


import UIKit

class ViewController: UIViewController {
    
    // MARK: - Create Game
    /// The game initialization with number of pairs of cards
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    /// The number of pairs of cards, which is calculated based on the count of buttons
    var numberOfPairsOfCards: Int {
        return сardButtons.count / 2
    }
    
    
    // MARK: - Counter
    /// The variable that keeps track of the number of card flips
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    /// Shows the number of card flips
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    
    // MARK: - Emoji
    /// Array of emoji for cards
    private var emojiChoices = ["👻", "🎃", "🧟‍♂️", "🧛🏿‍♂️", "😺", "😈"]
    private var emoji = [Int: String]()
    
    /// By identifier card, select from an array of emoji and place it on the card.
    /// - Parameter card: current card
    /// - Returns: return emoji
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int.random(in: 0..<emojiChoices.count)
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
    // MARK: - Card
    /// The array of cards that we get from the View
    @IBOutlet private var сardButtons: [UIButton]!
    
    /// Call a function that flips the card
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = сardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    
    // MARK: - Update View
    private func updateViewFromModel() {
        for index in сardButtons.indices {
            let button = сardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor
                    = card.isMatched ? UIColor.black.withAlphaComponent(0) : UIColor.systemOrange
            }
        }
    }

    
}

