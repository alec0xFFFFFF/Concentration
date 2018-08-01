//
//  ViewController.swift
//  Concentration
//
//  Created by Alexander K. White on 7/28/18.
//  Copyright © 2018 Alexander K. White. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    //  TODO: Hook into storyboard
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton){
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBAction func touchNewGame(_ sender: UIButton){
        let rand_index = Int(arc4random_uniform(UInt32(themes.count)))
        emojiChoices = themes[rand_index]
        flipCount = 0
        game = Concentration(numberOfPairOfCards: (cardButtons.count + 1) / 2)
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
    }
    
    var asianFlagChoices = ["🇾🇪", "🇻🇳", "🇹🇷", "🇹🇭", "🇹🇯", "🇸🇾", "🇸🇬", "🇵🇰"]
    var africanFlagChoices = ["🇨🇲", "🇨🇮", "🇪🇹", "🇬🇶", "🇱🇸", "🇲🇱", "🇲🇼", "🇸🇿",
                              "🇹🇬", "🇿🇲", "🇿🇼", "🇿🇦"]
    var southAmericanFlagChoices = ["🇵🇪", "🇵🇾", "🇧🇷", "🇺🇾", "🇦🇷", "🇨🇱", "🇨🇴", "🇻🇪", "🇬🇾", "🇸🇷"]
    var europeanFlagChoices = ["🇫🇷", "🇬🇧", "🇬🇷", "🇭🇷", "🇮🇪", "🇱🇹", "🇲🇨", "🇲🇹", "🇳🇱", "🇷🇴", "🇸🇰", "🇸🇪"]
    var northAmericanFlagChoices = ["🇨🇷", "🇺🇸", "🇲🇽", "🇨🇦", "🇭🇳", "🇬🇹", "🇵🇦", "🇳🇮", "🇸🇻"]
    var caribbeanFlagChoices = ["🇸🇽", "🇧🇶", "🇧🇸", "🇯🇲", "🇩🇴", "🇩🇲", "🇨🇺", "🇨🇼", "🇭🇹", "🇹🇹", "🇧🇧", "🇦🇼"]
    lazy var themes = [africanFlagChoices, asianFlagChoices, southAmericanFlagChoices, europeanFlagChoices, northAmericanFlagChoices, caribbeanFlagChoices]
    
    lazy var emojiChoices = themes[Int(arc4random_uniform(UInt32(themes.count)))]
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count - 1)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }

}

