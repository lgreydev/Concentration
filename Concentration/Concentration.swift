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
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for id in 1...numberOfPairsOfCards {
            let card = Card(identifier: id)
            cards += [card, card]
        }
    }
}









