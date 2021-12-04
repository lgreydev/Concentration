//  Branch main
//  ViewController.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 20.04.


import UIKit

class ConcentrationViewController: UIViewController {
    
    // MARK: IBOutlets
    /// The array of cards that we get from the View
    @IBOutlet private var сardButtons: [UIButton]!
    
    /// Shows the number of card flips
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet { updateFlipCountLabel() }
    }
    
    // MARK: Private Properties
    /// The game initialisation with number of pairs of cards
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    /// String of emoji for cards
    private var emojiChoices = "👻🎃🧟‍♂️🧛🏿‍♂️😺😈"
    private var emoji = [Card: String]()
    
    /// The number of pairs of cards, which is calculated based on the count of buttons
    private var numberOfPairsOfCards: Int {
        return сardButtons.count / 2
    }
    
    /// The variable that keeps track of the number of card flips
    private var flipCount = 0 {
        didSet { updateFlipCountLabel() }
    }
    
    // Theme View Controller
    private var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    // MARK: Private Methods
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [.strokeWidth: 5.0, .strokeColor: UIColor.black]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    /// By identifier card, select from an array of emoji and place it on the card.
    /// - Parameter card: current card
    /// - Returns: return emoji
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
    
    private func updateViewFromModel() {
        for index in сardButtons.indices {
            let button = сardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = CustomColor.grey
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor
                = card.isMatched ? CustomColor.clear : CustomColor.blue
            }
        }
    }
    
    // MARK: IBActions
    /// Call a function that flips the card
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = сardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
}

// MARK: - Constants
extension ConcentrationViewController {
    private struct CustomColor {
        static let blue = UIColor(red: 0.0, green: 0.58980089430000004, blue: 1.0, alpha: 1)
        static let grey = UIColor(red: 0.92143100499999997, green: 0.92145264149999995, blue: 0.92144101860000005, alpha: 1)
        static let clear = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0)
    }
}


