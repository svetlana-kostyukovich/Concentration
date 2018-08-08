//
//  Extentions.swift
//  Concentration
//
//  Created by Светлана Лобан on 3/21/18.
//  Copyright © 2018 Светлана Лобан. All rights reserved.
//

import Foundation

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self == 0 {
            return 0
        } else {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
    }
}
