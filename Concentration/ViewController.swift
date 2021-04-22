//
//  ViewController.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 20.04.2021.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    // MARK: - IBAction
    
    /// Call a function that flips the card
    @IBAction func touchCard(_ sender: UIButton) {
        flipCard(withEmoji: "👻", on: sender)
    }
    
    /// Call a function that flips the card
    @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCard(withEmoji: "🎃", on: sender)
    }
    
    
    
    // MARK: - Methods
    
    /// Flip the card face down if emoji match
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
}

