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

    var motionManager = CMMotionManager()
	
	var time = Timer()
	
	var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
        GameView.isHidden = false
		ResultView.isHidden = true
		
		startTimer()
		
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
                    if(angle > 115){
							self?.GameView.isHidden = true
							self?.ResultView.isHidden = false
							self?.resultViewController?.didGameWin()
                    }
                    
                    if(angle < 60){
							self?.GameView.isHidden = true
							self?.ResultView.isHidden = false
							self?.resultViewController?.didGamePass()
						
                    }
					
						if(angle > 60 && angle < 115){
							self?.GameView.isHidden = false
							self?.ResultView.isHidden = true
						}
					}
					
                }
                
            })
            
            print("Device motion started")
        }
        
        
        resultViewController?.didGamePass()
  
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "resultSegue" ){
            resultViewController = segue.destination as! ResultViewController
        }
    }
    

	func startTimer(){
		let updateSelector : Selector = #selector(SingleModeViewController.updateTime)
		time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: updateSelector, userInfo: nil, repeats: true)
	}
	
	func updateTime(){
		counter = counter + 1
		
		timer.title = String(counter)+"s"
	}

}
