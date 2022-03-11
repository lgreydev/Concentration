//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 05.12.2021.
//

import UIKit

class ConcentrationThemeChooserViewController: VCLLoggingViewController, UISplitViewControllerDelegate {
    
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
    
    private weak var timer: Timer?

    // The name of the View Controller​ where we are
    override var vclLoggingName: String {
         return "ThemeChooser"
    }


    
    // TODO
    override func viewDidLoad() {
        super.awakeFromNib()
        splitViewController?.delegate = self
    }

    // TODO
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
            if let cvc = secondaryViewController as? ConcentrationViewController {
                if cvc.theme == nil {
                    return true
                }
            }
            return false
        }
    
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
