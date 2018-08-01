//
//  Theme.swift
//  Concentration
//
//  Created by Alexander K. White on 8/1/18.
//  Copyright © 2018 Alexander K. White. All rights reserved.
//

import Foundation

struct Theme {
    
    var asianFlagChoices = ["🇾🇪", "🇻🇳", "🇹🇷", "🇹🇭", "🇹🇯", "🇸🇾", "🇸🇬", "🇵🇰"]
    var africanFlagChoices = ["🇨🇲", "🇨🇮", "🇪🇹", "🇬🇶", "🇱🇸", "🇲🇱", "🇲🇼", "🇸🇿",
                              "🇹🇬", "🇿🇲", "🇿🇼", "🇿🇦"]
    var southAmericanFlagChoices = ["🇵🇪", "🇵🇾", "🇧🇷", "🇺🇾", "🇦🇷", "🇨🇱", "🇨🇴", "🇻🇪", "🇬🇾", "🇸🇷"]
    var europeanFlagChoices = ["🇫🇷", "🇬🇧", "🇬🇷", "🇭🇷", "🇮🇪", "🇱🇹", "🇲🇨", "🇲🇹", "🇳🇱", "🇷🇴", "🇸🇰", "🇸🇪"]
    var northAmericanFlagChoices = ["🇨🇷", "🇺🇸", "🇲🇽", "🇨🇦", "🇭🇳", "🇬🇹", "🇵🇦", "🇳🇮", "🇸🇻"]
    var caribbeanFlagChoices = ["🇸🇽", "🇧🇶", "🇧🇸", "🇯🇲", "🇩🇴", "🇩🇲", "🇨🇺", "🇨🇼", "🇭🇹", "🇹🇹", "🇧🇧", "🇦🇼"]
    lazy var themes = [africanFlagChoices, asianFlagChoices, southAmericanFlagChoices, europeanFlagChoices, northAmericanFlagChoices, caribbeanFlagChoices]
    
    mutating func getRandomTheme() -> [String] {
        return themes[Int(arc4random_uniform(UInt32(themes.count)))]
    }
    
}
