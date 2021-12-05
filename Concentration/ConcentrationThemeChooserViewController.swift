//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 05.12.2021.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    
    // MARK: Private Properties
    private let themes = [
        "Sports": "🏋️‍♀️⛷🏌️‍♀️🚴‍♂️🧗‍♀️🤺🤽‍♀️⛹️🏄‍♀️🤼‍♀️🏇🏊‍♀️",
        "Faces": "🥰🥺🥳🤭🥴🤩🥵🤓🥶🥸🥱😭🤣😱😎",
        "Animals": "🐈‍⬛🐕🐿🐁🐂🦝🐍🐎🦍🐘🦆🐌🦅🦇🦜🦏🦞🦒🦈"
    ]

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChooseTheme" {
            if let themeName = (sender as? UIButton)?.titleLabel?.text, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }
}
