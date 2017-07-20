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
        return (cardPassed.count + cardCorrect.count)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCollectionViewCell
        
        cell.mainWord.text = words[indexPath.row].mainWord
        cell.firstWord.text = words[indexPath.row].firstWord
        cell.secondWord.text = words[indexPath.row].secondWord
        cell.thirdWord.text = words[indexPath.row].thirdWord
        cell.fourthWord.text = words[indexPath.row].fourthWord
        cell.fifthWord.text = words[indexPath.row].fifthWord
        
        
//        if(cardPassed.contains(Int(words[indexPath.row].id)) ){
//            cell.backgroundColor = UIColor.red
//        }
//        
//        if(cardCorrect.contains(Int(words[indexPath.row].id)) ){
//            cell.backgroundColor = UIColor.green
//        }
        
        
        
        return cell
    }
    
    
}
