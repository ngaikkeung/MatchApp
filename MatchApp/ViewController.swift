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
        print(cards.count)
        // Set the view controller as the data source and delegate of the collection view
        collectionView.dataSource = self
        collectionView.delegate = self
      
    }

    // MARK: - Collection View delegate method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
        
        // TODO: Configure it
        
        // Return it
        return cell
    }
    

}

