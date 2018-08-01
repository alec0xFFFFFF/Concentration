//
//  Concentration.swift
//  Concentration
//
//  Created by Alexander K. White on 7/30/18.
//  Copyright © 2018 Alexander K. White. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index:Int) {
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //  check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil //  no longer one and only...
            } else {
                //  either two cards or none face up
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairOfCards:Int) {
        for _ in 1...numberOfPairOfCards {
            let card = Card()
            cards += [card, card]
        }
        //  TODO: shuffle cards
        cards.shuffle()
    }
    
}

extension Array {
    /** Randomizes the order of an array's elements. */
    mutating func shuffle() {
        for _ in indices {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
