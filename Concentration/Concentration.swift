//
//  Concentration.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 27.04.2021.
//

import Foundation


struct Concentration {
    
    // MARK: Private Properties
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    // MARK: Initializers
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "You need at least one pair of cards to play, numberOfPairsOfCards = \(numberOfPairsOfCards)")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
    
    // MARK: Public Methods
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "is not index \(index)")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}

// MARK: Extension
extension Collection {
    var oneAndOnly: Element? {
        count == 1 ? first : nil
    }
}







