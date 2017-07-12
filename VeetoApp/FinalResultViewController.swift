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
        
        words.append(Card(id: 1, mainCard: "Dance", firstCard: "Ballet", secondCard: "Salsa", thirdCard: "Tango", fourthCard: "Ballroom", fifthCard: "Movement"))
        
        words.append(Card(id: 2, mainCard: "Flight", firstCard: "Bird", secondCard: "Cockpit", thirdCard: "Pilot", fourthCard: "Fly", fifthCard: "Air"))
        
        words.append(Card(id: 3, mainCard: "Pen", firstCard: "Ink", secondCard: "Ballpoint", thirdCard: "Name", fourthCard: "Astronaut", fifthCard: "BIC"))
        
        words.append(Card(id: 4, mainCard: "Letter", firstCard: "Writing", secondCard: "Stamp", thirdCard: "Mail", fourthCard: "Alphabet", fifthCard: "Email"))
        
        
        
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
        
        cell.mainWord.text = words[indexPath.row].mainCard
        cell.firstWord.text = words[indexPath.row].firstCard
        cell.secondWord.text = words[indexPath.row].secondCard
        cell.thirdWord.text = words[indexPath.row].thirdCard
        cell.fourthWord.text = words[indexPath.row].fourthCard
        cell.fifthWord.text = words[indexPath.row].fifthCard
        
        
        if(cardPassed.contains(words[indexPath.row].id) ){
            cell.backgroundColor = UIColor.blue
        }
        
        
        
        return cell
    }
    
    
}
