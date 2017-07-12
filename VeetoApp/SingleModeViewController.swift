//
//  SingleModeViewController.swift
//  VeetoApp
//
//  Created by IFCE on 05/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import UIKit
import CoreMotion

class SingleModeViewController: UIViewController {

    @IBOutlet var ResultView: UIView!

	@IBOutlet weak var timer: UINavigationItem!
    
    @IBOutlet weak var GameView: UIView!
    
    weak var resultViewController: ResultViewController?

    weak var gameViewController : GameViewController?
    
    var motionManager = CMMotionManager()
	
	var time = Timer()
	var gameCounter = 5
    var startGameCounter = 3
    
    var cardPassed = [Int] ()
    var cardCorrect = [Int] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gameCounter = 5
        startGameCounter = 3
        
        startTimer()
        
        resultViewController?.didGameWait(msg: "Prepare")
        GameView.isHidden = true
        ResultView.isHidden = false
        timer.title = String(startGameCounter)+"s"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        motionManager.stopDeviceMotionUpdates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "resultSegue" ){
            resultViewController = segue.destination as! ResultViewController
        }
        
        if(segue.identifier == "gameSegue"){
            gameViewController = segue.destination as! GameViewController
        }
        
        if(segue.identifier == "finalResultSegue"){
            let finalResultViewController = segue.destination as! FinalResultViewController
            
            finalResultViewController.cardPassed = cardPassed
            finalResultViewController.cardCorrect = cardCorrect
            
        }
        
        
        
    }
    
    func startGyro() {
        var didEnterPass = false
        var didEnterCorrect = false
        
        if motionManager.isDeviceMotionAvailable == true {
            
            motionManager.deviceMotionUpdateInterval = 0.1;
            
            let queue = OperationQueue()
            motionManager.startDeviceMotionUpdates(to: queue, withHandler: { [weak self] (motion, error) -> Void in
                
                // Get the attitude of the device
                if let attitude = motion?.attitude {
                    // Get the pitch (in radians) and convert to degrees.
                    // Import Darwin to get M_PI in Swift
                    let angle = abs(attitude.roll * 180.0/Double.pi)
                    
                    
                    DispatchQueue.main.async {
                        if(angle > 115 && !didEnterPass){
                            self?.GameView.isHidden = true
                            self?.ResultView.isHidden = false
                            self?.resultViewController?.didGameWin()
                            let cardId = self?.gameViewController?.didChangeCard()
                            didEnterPass = true
                            self?.cardPassed.append(cardId!)
                            
                        }
                        
                        if(angle < 60 && !didEnterCorrect){
                            self?.GameView.isHidden = true
                            self?.ResultView.isHidden = false
                            self?.resultViewController?.didGamePass()
                            let cardId = self?.gameViewController?.didChangeCard()
                            didEnterCorrect = true
                            self?.cardCorrect.append(cardId!)
                            
                        }
                        
                        if(angle > 60 && angle < 115){
                            didEnterPass = false
                            didEnterCorrect = false
                            self?.GameView.isHidden = false
                            self?.ResultView.isHidden = true
                        }
                    }
                    
                }
                
            })
            
            print("Device motion started")
        }
    }

	func startTimer(){
		let updateSelector : Selector = #selector(SingleModeViewController.updateTime)
		time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: updateSelector, userInfo: nil, repeats: true)
	}
	
	func updateTime(){
        startGameCounter = startGameCounter - 1
        
        if (startGameCounter == 0) {
            startGyro()
        }
        if (startGameCounter <= 0) {
            gameCounter = gameCounter - 1
            
            if (gameCounter == 0) {
                self.timer.title = String("Voltar")
                self.time.invalidate()
                self.performSegue(withIdentifier: "finalResultSegue", sender: nil)
            }
            else {
                timer.title = String(gameCounter)+"s"
            }
        }
        else {
            switch startGameCounter {
            case 2:
                resultViewController?.didGameWait(msg: "Ready?")
            case 1:
                resultViewController?.didGameWait(msg: "Go!!!")
            default:
                return
            }
        
            GameView.isHidden = true
            ResultView.isHidden = false
            timer.title = String(startGameCounter)+"s"
        }
	}

}
