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
        
        // TODO: Configure it
        cell.configureCell(card: cards[indexPath.row])
        
        // Return it
        return cell
    }
    
    // MARK: - Collection View delegate method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get a reference to the cell was selected
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        // Check the state of the card to determine flip up or down
        if(cell?.card?.isFlipped == false){
            cell?.flipUp()
        }else{
            cell?.flipDown()
        }
    }
}

