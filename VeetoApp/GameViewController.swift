//
//  GameViewController.swift
//  VeetoApp
//
//  Created by IFCE on 07/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
//    var words  = [Int : Card](
    
    
    
    @IBOutlet weak var mainWord: UILabel!
    
    @IBOutlet weak var firstWord: UILabel!

    @IBOutlet weak var secondWord: UILabel!
    
    @IBOutlet weak var thirdWord: UILabel!
    
    @IBOutlet weak var fourthWord: UILabel!
    
    @IBOutlet weak var fifthWord: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	func loadCard(card : Card){
		
        mainWord.text = card.mainWord
        firstWord.text = card.firstWord
        secondWord.text = card.secondWord
        thirdWord.text = card.thirdWord
        fourthWord.text = card.fourthWord
        fifthWord.text = card.fifthWord
        
    }
    
    
    func didChangeCard() {
        loadCard(card: CardProvider.sharedInstance.provideCard())
    }
	
	
    
}

