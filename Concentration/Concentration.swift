//
//  Concentration.swift
//  Concentration
//
//  Created by Alexander K. White on 7/30/18.
//  Copyright © 2018 Alexander K. White. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    private(set) var flipCount = 0
    
    private(set) var score = 0
    
    func chooseCard(at index:Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        flipCount += 1
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //  check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    if cards[matchIndex].wasSeen {
                        score -= 1
                    }
                    if cards[index].wasSeen {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                cards[matchIndex].wasSeen = true
                cards[index].wasSeen = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairOfCards:Int) {
        assert(numberOfPairOfCards > 0, "Concentration.init(numberOfPairOfCards: \(numberOfPairOfCards)): must have at least one pair of cards")
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
