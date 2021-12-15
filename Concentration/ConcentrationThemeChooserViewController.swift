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
        "Animals": "🐈‍⬛🐕🐿🐁🐂🦝🐍🐎🦍🐘🦆🐌🦅🦇🦜🦏🦞🦒🦈",
        "Faces": "🥰🥺🥳🤭🥴🤩🥵🤓🥶🥸🥱😭🤣😱😎",
    ]
    
    private var splitViewDetailConcentrationViewController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChooseTheme" {
            if let themeName = (sender as? UIButton)?.titleLabel?.text, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                    lastSeguedToConcentrationViewController = cvc
                }
            }
        }
    }
    
    // MARK: IBAction
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationViewController {
            if let themeName = (sender as? UIButton)?.titleLabel?.text, let theme = themes[themeName] {
                cvc.theme = theme
            }
        } else if let cvc = lastSeguedToConcentrationViewController {
            if let themeName = (sender as? UIButton)?.titleLabel?.text, let theme = themes[themeName] {
                cvc.theme = theme
            }
            navigationController?.pushViewController(cvc, animated: true)
            
        } else {
            performSegue(withIdentifier: "ChooseTheme", sender: sender)
        }
    }
}
