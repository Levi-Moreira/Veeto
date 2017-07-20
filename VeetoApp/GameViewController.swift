//
//  GameViewController.swift
//  VeetoApp
//
//  Created by IFCE on 07/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var words  = [Card]()
    
    var index = 0
    
    var currentCardId : Int64 {
        get {
            return words[index].id
        }
    }
    
    @IBOutlet weak var mainWord: UILabel!
    
    @IBOutlet weak var firstWord: UILabel!

    @IBOutlet weak var secondWord: UILabel!
    
    @IBOutlet weak var thirdWord: UILabel!
    
    @IBOutlet weak var fourthWord: UILabel!
    
    @IBOutlet weak var fifthWord: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        let card1 = Card.create()
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
 

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCard(){
        mainWord.text = words[index].mainWord
        firstWord.text = words[index].firstWord
        secondWord.text = words[index].secondWord
        thirdWord.text = words[index].thirdWord
        fourthWord.text = words[index].fourthWord
        fifthWord.text = words[index].fifthWord
    }
    
    
    func didChangeCard() {
        
        index = index + 1
        
        if(index == words.count){
            index = 0
        }
        
        loadCard()
        
        
    }
    

}
