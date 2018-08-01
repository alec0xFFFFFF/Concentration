//
//  ViewController.swift
//  Concentration
//
//  Created by Alexander K. White on 7/28/18.
//  Copyright © 2018 Alexander K. White. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //  TODO: All new UI you add should be nicely laid out and look good in portrait mode on an iPhone X.
    
    //  TODO: Change the background and the “card back color” to match the theme. For example, our Halloween theme has a black background and orange card backs. Maybe a “winter” theme might have blue and white colors. A “construction” theme could be black and yellow. UIViewController has a property called view which is connected to the top-level view in the scene (i.e. the view that was black in lecture).
    
    //  TODO: You can find out what time it is using the Date struct. Read the documentation to figure out how it works and then use it to adjust your scoring so that the more quickly moves are made, the better the user’s score is. You can modify the scoring Required Task in doing this, but the score must still somehow be dependent on matches being rewarded and mismatches of previously-seen cards being penalized (in addition to being time-based). It’s okay if a “good score” is a low number and a “bad score” is a high number
    
    lazy var game = Concentration(numberOfPairOfCards: (cardButtons.count + 1) / 2)
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton){
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            scoreLabel.text = "Score: \(game.score)"
            flipCountLabel.text = "Flips: \(game.flipCount)"
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBAction func touchNewGame(_ sender: UIButton){
        emojiChoices = myTheme.getRandomTheme()
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
    
    var myTheme = Theme()

    lazy var emojiChoices = myTheme.getRandomTheme()
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count - 1)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }

}

