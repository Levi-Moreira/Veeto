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
    
    var currentCardId : Int {
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

        words.append(Card(id: 1, mainCard: "Dance", firstCard: "Ballet", secondCard: "Salsa", thirdCard: "Tango", fourthCard: "Ballroom", fifthCard: "Movement"))
        
        words.append(Card(id: 2, mainCard: "Flight", firstCard: "Bird", secondCard: "Cockpit", thirdCard: "Pilot", fourthCard: "Fly", fifthCard: "Air"))
        
        words.append(Card(id: 3, mainCard: "Pen", firstCard: "Ink", secondCard: "Ballpoint", thirdCard: "Name", fourthCard: "Astronaut", fifthCard: "BIC"))
        
        words.append(Card(id: 4, mainCard: "Letter", firstCard: "Writing", secondCard: "Stamp", thirdCard: "Mail", fourthCard: "Alphabet", fifthCard: "Email"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCard(){
        mainWord.text = words[index].mainCard
        firstWord.text = words[index].firstCard
        secondWord.text = words[index].secondCard
        thirdWord.text = words[index].thirdCard
        fourthWord.text = words[index].fourthCard
        fifthWord.text = words[index].fifthCard
    }
    
    
    func didChangeCard() {
        
        index = index + 1
        
        if(index == words.count){
            index = 0
        }
        
        loadCard()
        
        
    }
    

}
