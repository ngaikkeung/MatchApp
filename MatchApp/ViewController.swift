//
//  ViewController.swift
//  MatchApp
//
//  Created by KK NGAI on 16/6/2020.
//  Copyright © 2020 KK NGAI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let model = CardModel()
    var cards = [Card]()
    
    var firstFlipCardIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cards = model.getCards()
        
        // Set the view controller as the data source and delegate of the collection view
        collectionView.dataSource = self
        collectionView.delegate = self
      
    }

    // MARK: - Collection View data source method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        // Return it
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let cardCell = cell as? CardCollectionViewCell
        
        // Configure cell
       cardCell?.configureCell(card: cards[indexPath.row])
    }
    
    // MARK: - Collection View delegate method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get a reference to the cell was selected
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        // Check the state of the card to determine flip up or down
        if cell?.card?.isFlipped == false && cell?.card?.isMatched == false {
            cell?.flipUp()
            
            // Check the card is first flipped card or second flipped card
            if firstFlipCardIndex == nil {
                
                // This is the first flipped card
                firstFlipCardIndex = indexPath
                
            }else{
                
                // Second card is flipped
                
                // Run the compare logic
                checkForMatch(indexPath )
            }
            
        }
    }
    
    // MARK: Game Logic methods
    
    func checkForMatch(_ secondFlippedIndex: IndexPath){
        
        // Get the two car object
        let firstCard = cards[firstFlipCardIndex!.row]
        let secondCard = cards[secondFlippedIndex.row]
        
        // Get the two collection view cells that repesent card one and two
        let cardOneCell = collectionView.cellForItem(at: firstFlipCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedIndex) as? CardCollectionViewCell
        
        // Compare two car object
        if firstCard.imageName == secondCard.imageName {
            
            // Two object is matched
            
            // Update status and remove the cards view
            firstCard.isMatched = true
            secondCard.isMatched = true
            
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
        }else{
            
            // Two object is not matched
            firstCard.isFlipped = false
            secondCard.isFlipped = false
            
            // Flip them down
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
        }
        
        // Reset the first card index
        firstFlipCardIndex = nil
    }
    
}

