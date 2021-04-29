//
//  Concentration.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 27.04.2021.
//

import Foundation


class Concentration {
    
    // MARK: - Variables
    var cards = [Card]()
    
    
    
    // MARK: - Methods
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}









