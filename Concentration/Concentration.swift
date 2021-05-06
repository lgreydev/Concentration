//
//  Concentration.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 27.04.2021.
//

import Foundation


class Concentration {
    
    // MARK: - Card
    var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "is not index \(index)")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    
    // MARK: - Init
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "You need at least one pair of cards to play, numberOfPairsOfCards = \(numberOfPairsOfCards)")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }                           
    }
}









