//
//  Card.swift
//  Concentration
//
//  Created by Alexander K. White on 7/30/18.
//  Copyright © 2018 Alexander K. White. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var wasSeen = false
    var identifier: Int
    
    private static var identityFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identityFactory += 1
        return identityFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
