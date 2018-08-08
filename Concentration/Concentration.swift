//
//  Concentration.swift
//  Concentration
//
//  Created by Светлана Лобан on 3/13/18.
//  Copyright © 2018 Светлана Лобан. All rights reserved.
//

import Foundation

class Concentration {
    private (set) var cards = [Card]()
    private (set) var score = 0
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            assert(numberOfPairsOfCards > 0, "At least one pair of cards is necessary")
            let card = Card()
            //cards.append(card)
            //cards.append(card)
            cards += [card, card]
            
        }
        shuffle()
    }
    
    private func shuffle() {
        var shuffledCards = [Card]()
        while cards.count > 0 {
            let randomIndex = cards.count.arc4random
            shuffledCards += [cards.remove(at: randomIndex)]
        }
        cards = shuffledCards
    }
    
    func setToDefault() {
        for index in cards.indices {
            cards[index].isFacedUp = false
            cards[index].isMatched = false
            cards[index].isSeen = false
            score = 0
        }
        shuffle()
    }
    
    private var indexOfOnlyFacedCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFacedUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set(newValue) {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration chooses cards at \(index) : no such index in cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyFacedCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else if cards[index].isSeen == true || cards[matchIndex].isSeen == true {
                    score -= 1
                } else {
                    cards[index].isSeen = true
                    cards[matchIndex].isSeen = true
                }
                cards[index].isFacedUp = true
            } else {
                indexOfOnlyFacedCard = index
            }
        }
    }
}
