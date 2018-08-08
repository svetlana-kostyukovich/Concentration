//
//  Themes.swift
//  Concentration
//
//  Created by Светлана Лобан on 3/14/18.
//  Copyright © 2018 Светлана Лобан. All rights reserved.
//

import Foundation
import UIKit


class Themes {
    
    let themes = [1 : (UIColor.orange, ["👻", "💀", "😺", "🎃", "👽", "🧟‍♀️", "🧛🏻‍♂️", "😈"]),
                  2 : (UIColor.yellow, ["👶🏻", "👧🏻", "👲🏻", "👳‍♀️", "🕵🏻‍♀️", "👵🏻", "👩‍🎤", "👷‍♀️"]),
                  3 : (UIColor.purple, ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐨"]),
                  4 : (UIColor.green, ["🌵", "🎄", "🌳", "🌿", "🍀", "🍁", "🍄", "🌻"]),
                  5 : (UIColor.magenta, ["🍏", "🍒", "🥦", "🥑", "🌶", "🥝", "🍇", "🍓"]),
                  6 : (UIColor.blue, ["⛷", "🏂", "🤾‍♀️", "⛹️‍♀️", "🏄‍♂️", "⛹️‍♀️", "🤸‍♀️", "🏊‍♀️"])
    ]
    
    //let colors = [UIColor.orange, UIColor.yellow, UIColor.purple, UIColor.green, UIColor.magenta, UIColor.blue]
    
    //let randomKey = Int(arc4random_uniform(UInt32(6)))
    //let randomKey : Int?
    //init() {
    //    randomKey = Int(arc4random_uniform(UInt32(themes.count)))
    //}
    
    func getTheme() -> (UIColor, [String]) {
        let randomKey = Int(arc4random_uniform(UInt32(themes.count)))
        if let theme = themes[randomKey] {
        return theme
        }
        return themes[1]!
    }
}
