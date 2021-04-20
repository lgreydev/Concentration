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
    /// - Parameter sender: The game card
    @IBAction func touchCard(_ sender: UIButton) {
        print(#line, #function)
        flipCard(withEmoji: "🧟‍♂️", on: sender)
    }
    
    // MARK: - Methods
    
    /// Flip the card face down if emoji match
    /// - Parameters:
    ///   - emoji: The element that is compared to the title of the button
    ///   - button: The game map in which we make changes
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            print(#line)
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.backgroundColor = .white
            button.setTitle(emoji, for: .normal)
            print(#line)
        }
    }
}

