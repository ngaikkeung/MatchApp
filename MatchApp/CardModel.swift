//
//  CardModel.swift
//  MatchApp
//
//  Created by KK NGAI on 16/6/2020.
//  Copyright © 2020 KK NGAI. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        // Declare a empty array
        var generatedsCards = [Card]()
        
        // Declare a checking duplicate array
        var alreadyExists = [Int]()
        
        // Randomly generate 8 paris of card
        for _ in 1...8 {
            
            // Generate a random number
            var randomNumber = Int.random(in: 1...13)
            
            // Check duplicate number
            while alreadyExists.contains(randomNumber) {
                randomNumber = Int.random(in: 1...13)
            }
            
            // Create two card objectes
            let cardOne = Card()
            let cardTwo = Card()
            
            // Set their image name
            cardOne.imageName = "card\(randomNumber)"
            cardTwo.imageName = "card\(randomNumber)"
            
            // Add them to the array
            generatedsCards += [cardOne, cardTwo]
            
            // Update checking duplicate array
            alreadyExists.append(randomNumber)
            print(alreadyExists)
        }
        
        // Randomize the cards within array
        generatedsCards.shuffle()
        
        // Return the cards array
        return generatedsCards
    }
}
