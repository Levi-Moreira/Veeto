//
//  FinalResultViewController.swift
//  VeetoApp
//
//  Created by ifce on 10/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import UIKit
import AVFoundation

class FinalResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
	
	var player: AVAudioPlayer!
	var endSound: AVAudioPlayer!
	

    var words  = CardProvider.sharedInstance.retrievePlayedCards()
   

    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
			
		
//			print(words)
        
			
        
            // Sound end
            let pathEnd = Bundle.main.path(forResource: "end", ofType: "mp3")!
            let urlEnd = URL(fileURLWithPath: pathEnd)
            do {
                endSound = try AVAudioPlayer(contentsOf: urlEnd)
            } catch {
                print("Error of End")
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        endSound.stop()
    }
    
    @IBAction func didTapMenuButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (words.count)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCollectionViewCell
        
        cell.mainWord.text = words[indexPath.row].mainWord
        cell.firstWord.text = words[indexPath.row].firstWord
        cell.secondWord.text = words[indexPath.row].secondWord
        cell.thirdWord.text = words[indexPath.row].thirdWord
        cell.fourthWord.text = words[indexPath.row].fourthWord
        cell.fifthWord.text = words[indexPath.row].fifthWord
        
        
        if(CardProvider.sharedInstance.wrongCards.contains(Int(words[indexPath.row].id!)) ){
            cell.backgroundColor = UIColor.red
        }
        
        if(CardProvider.sharedInstance.correctCards.contains(Int(words[indexPath.row].id!)) ){
            cell.backgroundColor = UIColor.green
        }

        
        player = self.endSound
        endSound.prepareToPlay()
        endSound.play()

        
        return cell
        
    }
    
    
}
