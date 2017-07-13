//
//  FinalResultViewController.swift
//  VeetoApp
//
//  Created by ifce on 10/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import UIKit


class FinalResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var words  = [Card]()
    var index = 0
    
    var cardPassed = [Int] ()
    var cardCorrect = [Int] ()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
            let card1 =  Card.create()
            card1.id = 1
            card1.mainWord = "Dance"
            card1.firstWord = "Ballet"
            card1.secondWord = "Ballet"
            card1.thirdWord = "Ballet"
            card1.fourthWord = "Ballet"
            card1.fifthWord = "Ballet"
            words.append(card1)
            
            let card2 =  Card.create()
            card2.id = 1
            card2.mainWord = "Flight"
            card2.firstWord = "Bird"
            card2.secondWord = "Cockpit"
            card2.thirdWord = "Pilot"
            card2.fourthWord = "Fly"
            card2.fifthWord = "Air"
            words.append(card2)
            
            let card3 =  Card.create()
            card3.id = 1
            card3.mainWord = "Pen"
            card3.firstWord = "Ink"
            card3.secondWord = "Ballpoint"
            card3.thirdWord = "Name"
            card3.fourthWord = "Astronaut"
            card3.fifthWord = "BIC"
            words.append(card3)
            
            let card4 =  Card.create()
            card4.id = 1
            card4.mainWord = "Letter"
            card4.firstWord = "Writing"
            card4.secondWord = "Stamp"
            card4.thirdWord = "Mail"
            card4.fourthWord = "Alphabet"
            card4.fifthWord = "Email"
            words.append(card4)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapMenuButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return words.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCollectionViewCell
        
        cell.mainWord.text = words[indexPath.row].mainWord
        cell.firstWord.text = words[indexPath.row].firstWord
        cell.secondWord.text = words[indexPath.row].secondWord
        cell.thirdWord.text = words[indexPath.row].thirdWord
        cell.fourthWord.text = words[indexPath.row].fourthWord
        cell.fifthWord.text = words[indexPath.row].fifthWord
        
        
        if(cardPassed.contains(Int(words[indexPath.row].id)) ){
            cell.backgroundColor = UIColor.red
        }
        
        if(cardCorrect.contains(Int(words[indexPath.row].id)) ){
            cell.backgroundColor = UIColor.green
        }
        
        
        
        return cell
    }
    
    
}
