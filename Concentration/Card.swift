//
//  Card.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 27.04.2021.
//

import Foundation


struct Card {
    
    // MARK: - Variables
    var isFaceUp = false
    var isMatched = false
    var identifier: Int

    static var identifierFactory = 0
    
    // MARK: - Methods
    /// The function creates an unique identifier number for the card. The number increases by +1 for each iteration.
    /// - Returns: Unique number identifier for card
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        identifier = Card.getUniqueIdentifier()
    }
}