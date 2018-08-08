//
//  ViewController.swift
//  Concentration
//
//  Created by Светлана Лобан on 3/4/18.
//  Copyright © 2018 Светлана Лобан. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    private let theme = Themes()
    //var backgroundColor: UIColor
    //var emojiChoices : [String]
    private var (backgroundColor, emojiChoices) : (UIColor, [String]) = Themes().getTheme()
    
    private var emoji = [Int: String]()
    
    @IBAction private func newGame(_ sender: UIButton) {
        flipCount = 0
        game.setToDefault()
        (backgroundColor, emojiChoices) = theme.getTheme()  // theme tuple
        //emojiChoices = theme.getTheme().1
        emoji = [:]
        for index in cardButtons.indices {
            let button = cardButtons[index]
            button.setTitle("", for: .normal)
            button.backgroundColor = backgroundColor
        }
        
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        //flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            flipCount = game.score
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : backgroundColor
            }
            
        }
    }
    
    //var emojiChoices: [String] = ["👻", "💀", "😺", "🎃", "👽", "🧟‍♀️", "🧛🏻‍♂️", "😈"]
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex =  emojiChoices.count.arc4random
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

