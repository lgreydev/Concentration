//
//  Int+random.swift
//  Concentration
//
//  Created by Sergey Lukaschuk on 06.05.2021.
//

import Foundation

extension Int {
    var random: Int {
        if self > 0 {
            return Int.random(in: 0..<self)
        } else if self < 0 {
            return Int.random(in: 0..<abs(self))
        } else {
            return 0
        }
    }
}
