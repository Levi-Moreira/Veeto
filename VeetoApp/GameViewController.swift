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
    
    @IBOutlet weak var timer: UILabel!
   
    @IBOutlet weak var mainCard: UIImageView!
    
    @IBOutlet weak var bolImage: UIImageView!
    
    
    @IBOutlet weak var backImage: UIButton!
    
    
    let cardImages: [String] = ["azulBranco", "rosaBranco", "roxoBranco", "amareloBranco"]
    
    
    let bolImages: [String] = ["circle_green", "circle_pink", "circle_purple", "circle_yellow"]
    
    let backImages: [String] = ["back_green", "back_pink", "back_purple", "back_yellow"]
    
    var indexCard = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	func loadCard(card : Card){
		mainCard.image = UIImage(named: cardImages[indexCard])
        bolImage.image = UIImage(named: bolImages[indexCard])
        backImage.setImage(UIImage(named: backImages[indexCard]), for: .normal)
        mainWord.text = card.mainWord
        firstWord.text = card.firstWord
        secondWord.text = card.secondWord
        thirdWord.text = card.thirdWord
        fourthWord.text = card.fourthWord
        fifthWord.text = card.fifthWord
        
        indexCard += 1
        
        if (indexCard == 4) {
            indexCard = 0
        }
        
    }
    
    
    func didChangeCard() {
        loadCard(card: CardProvider.sharedInstance.provideCard())
    }
    
    func setTime(time : Int){
        timer.text = "\(time)s"
    }
    @IBAction func animateBack(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        sender.transform = .identity
            },
                       completion: nil)
    }
	
    @IBAction func didTabBack(_ sender: UIButton) {
            self.navigationController?.popViewController(animated: true)
    }
	
    
}

