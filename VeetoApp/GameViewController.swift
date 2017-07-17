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
    
    var currentCard = (0, Card())
    
    var currentCardId : Int {
        get {
            return currentCard.0
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

//        words.append(Card(id: 1, mainWord: "Dance", firstWord: "Ballet", secondWord: "Salsa", thirdWord: "Tango", fourthWord: "Ballroom", fifthWord: "Movement"))
//        
//        words.append(Card(id: 2,mainWord: "Flight", firstWord: "Bird", secondWord: "Cockpit", thirdWord: "Pilot", fourthWord: "Fly", fifthWord: "Air"))
//        
//        words.append(Card(id: 3,mainWord: "Pen", firstWord: "Ink", secondWord: "Ballpoint", thirdWord: "Name", fourthWord: "Astronaut", fifthWord: "BIC"))
//        
//        words.append(Card(id: 4,mainWord: "Letter", firstWord: "Writing", secondWord: "Stamp", thirdWord: "Mail", fourthWord: "Alphabet", fifthWord: "Email"))
//        
// 
      readJson()
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
    
    private func readJson() {
        do {
            if let file = Bundle.main.url(forResource: "veetoCards", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                let jsonString = String(describing: json)
                print(jsonString)
                
                let cards = Dictionary<String, Card>()
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    

}
