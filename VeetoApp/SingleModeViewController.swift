//
//  SingleModeViewController.swift
//  VeetoApp
//
//  Created by IFCE on 05/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class SingleModeViewController: UIViewController {

    /* OUtlests for controlling the UI*/
    @IBOutlet var ResultView: UIView!

	@IBOutlet weak var timer: UINavigationItem!
    
    @IBOutlet weak var GameView: UIView!
    
    /* View controllers for the result (pass and correct) and game screens*/
    
    weak var resultViewController: ResultViewController?

    weak var gameViewController : GameViewController?
    
    let preferences = UserDefaults.standard
    
    let soundSettings = "soundSettings"
    let timeSettings = "timeSettings"
    
    
    /*Start up CoreMotion manager*/
    var motionManager = CMMotionManager()
	
	var time = Timer()
    
    
    var gameCounter = 30
    var startGameCounter = 3
    
    //Keeps the ids of the correct cards and the passed cards
    var cardPassed = [Int] ()
    var cardCorrect = [Int] ()
    
    var player: AVAudioPlayer?
    var startSound: AVAudioPlayer?
    var correctSound: AVAudioPlayer?
    var passSound: AVAudioPlayer?
    var tictacSound: AVAudioPlayer?
	
	 var queue = OperationQueue()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

		if(preferences.bool(forKey: soundSettings)){
			// Sound Start
			let pathStart = Bundle.main.path(forResource: "start", ofType: "mp3")!
			let urlStart = URL(fileURLWithPath: pathStart)
			do {
				startSound = try AVAudioPlayer(contentsOf: urlStart)
			} catch {
				print("Error of Start")
			}
			
			// Sound Correct
			let pathCorrect = Bundle.main.path(forResource: "correct", ofType: "wav")!
			let urlCorrect = URL(fileURLWithPath: pathCorrect)
			do {
				correctSound = try AVAudioPlayer(contentsOf: urlCorrect)
			} catch {
				print("Error of Correct")
			}
			
			// Sound Pass
			let pathPass = Bundle.main.path(forResource: "pass1", ofType: "mp3")!
			let urlPass = URL(fileURLWithPath: pathPass)
			do {
				passSound = try AVAudioPlayer(contentsOf: urlPass)
			} catch {
				print("Error of Pass")
			}
			
			// Sound Tic Tac
			let pathTictac = Bundle.main.path(forResource: "tic-tac", ofType: "wav")!
			let urlTictac = URL(fileURLWithPath: pathTictac)
			do {
				tictacSound = try AVAudioPlayer(contentsOf: urlTictac)
			} catch {
				print("Error of Tic Tac")
			}
			
		}
		
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true

    }
	
	
    override func viewWillAppear(_ animated: Bool) {
        CardProvider.sharedInstance.restoreProvider()
        //set up game time

        
        switch preferences.integer(forKey: timeSettings) {
        case 0:
            gameCounter = 60
        case 1:
            gameCounter = 90
        case 2:
            gameCounter = 120
        default:
            gameCounter = 60
        }
		
		//gameCounter = 15
		
		

        
        //3 seconds for the game to start
        startGameCounter = 3
        
        cardPassed.removeAll()
        cardCorrect.removeAll()
        
        startTimer()
        
        
        resultViewController?.didGameWait(msg: "Prepare")
        GameView.isHidden = true
        ResultView.isHidden = false
        timer.title = String(startGameCounter)+"s"
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        motionManager.stopDeviceMotionUpdates()
        startSound?.stop()
        correctSound?.stop()
        passSound?.stop()
        tictacSound?.stop()
		time.invalidate()
		self.queue.cancelAllOperations()
        self.player = nil
		
		
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*starts and configure gyroscope for detecting foward tilt and backward tilt*/
    func startGyro() {
        var didEnterPass = false
        var didEnterCorrect = false
        
        if motionManager.isDeviceMotionAvailable == true {
            
            motionManager.deviceMotionUpdateInterval = 0.1;
            
//			self.queue = OperationQueue()
            motionManager.startDeviceMotionUpdates(to: queue, withHandler: { [weak self] (motion, error) -> Void in
                
                if let attitude = motion?.attitude {
                    let angle = abs(attitude.roll * 180.0/Double.pi)
                    
                    DispatchQueue.main.async {
                        if(angle > 115 && !didEnterCorrect){
                            self?.GameView.isHidden = true
                            self?.ResultView.isHidden = false
                            self?.resultViewController?.didGameWin()
                            
//                            let cardId = self?.gameViewController?.currentCardId
							
							CardProvider.sharedInstance.correctCard()
							self?.player = self?.correctSound
							self?.correctSound?.prepareToPlay()
							self?.correctSound?.play()
                            self?.gameViewController?.didChangeCard()
                            didEnterCorrect = true
							
							
							
                        }
                        
                        if(angle < 60 && !didEnterPass){
                            self?.GameView.isHidden = true
                            self?.ResultView.isHidden = false
                            self?.resultViewController?.didGamePass()
//                            let cardId = self?.gameViewController?.currentCardId
							
							CardProvider.sharedInstance.passCard()
							self?.player = self?.passSound
							self?.passSound?.prepareToPlay()
							self?.passSound?.play()
                            self?.gameViewController?.didChangeCard()
                            
                            didEnterPass = true

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
        }
    }
  
    
    func startTimer(){
		let updateSelector : Selector = #selector(SingleModeViewController.updateTime)
		time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: updateSelector, userInfo: nil, repeats: true)
        
        self.player = startSound
        startSound?.prepareToPlay()
        startSound?.play()
	}
    
    
	func updateTime(){
        startGameCounter = startGameCounter - 1
        
        if (startGameCounter == 0) {
            startGyro()
            self.gameViewController?.loadCard(card: CardProvider.sharedInstance.provideCard())
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
                
                // Sound Tic Tac
                if(gameCounter == 10) {
                    player = self.tictacSound
                    tictacSound?.prepareToPlay()
                    tictacSound?.play()
                }
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //get references for game view controller and result view controller
        if(segue.identifier == "resultSegue" ){
            resultViewController = segue.destination as! ResultViewController
        }
        
        if(segue.identifier == "gameSegue"){
            gameViewController = segue.destination as! GameViewController
        }
        
        //final result will appear, set variables needed for presenting the end game
        if(segue.identifier == "finalResultSegue"){
            let finalResultViewController = segue.destination as! FinalResultViewController
//            
//            finalResultViewController.cardPassed = cardPassed
//            finalResultViewController.cardCorrect = cardCorrect
        }
    }

}
