//
//  CardCollectionViewCell.swift
//  MatchApp
//
//  Created by KK NGAI on 16/6/2020.
//  Copyright © 2020 KK NGAI. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card: Card?
    
    func configureCell(card: Card){
        
        // Assign card
        self.card = card
        
        // Set the front image view to the associated card
        frontImageView.image = UIImage(named: card.imageName)
        
        // Reset the stat of the card by card prop and show front and back correctly
        if card.isFlipped == true{
            // Show front image view
            flipUp(speed: 0)
        }else {
            // Show back image view
            flipDown(speed: 0)
        }
        
    }
    
    func flipUp(speed: TimeInterval = 0.3){
        // Transition to flip up the selected card
        UIView.transition(from: backImageView, to: frontImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromLeft], completion: nil)
        
        // Update the state of card
        card?.isFlipped = true
    }
    
    func flipDown(speed: TimeInterval = 0.3){
        // Transition to flip down the selected card
        UIView.transition(from: frontImageView, to: backImageView, duration: speed, options: [.showHideTransitionViews, .transitionFlipFromRight], completion: nil)
        
        // Update the state of card
       card?.isFlipped = false
    }
}
