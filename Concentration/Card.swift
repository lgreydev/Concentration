//
//  Card.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 27.04.2021.
//

import Foundation


struct Card: Hashable {
    
    // MARK: Implementation Protocols
    // Implementation protocol Equatable
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    // Implementation protocol Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    
    // MARK: - Variables
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int

    
    // MARK: - Identifier
    private static var identifierFactory = 0
    
    /// The function creates a unique identifier number for the card. The number increases by +1 for each iteration.
    /// - Returns: Unique number identifier for card
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    
    // MARK: - Init
    init() {
        identifier = Card.getUniqueIdentifier()
    }
}

