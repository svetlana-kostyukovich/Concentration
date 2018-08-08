//
//  Card.swift
//  Concentration
//
//  Created by Светлана Лобан on 3/13/18.
//  Copyright © 2018 Светлана Лобан. All rights reserved.
//

import Foundation

struct Card {
    var isFacedUp = false
    var isMatched = false
    var isSeen = false
    var identifier: Int
    
    private static var idFactory = 0
    
    private static func getUniqueID() -> Int {
        idFactory += 1
        return idFactory
    }
    
    init() {
        self.identifier = Card.getUniqueID()
    }
}
