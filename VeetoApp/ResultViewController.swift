//
//  ResultViewController.swift
//  VeetoApp
//
//  Created by IFCE on 05/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
	@IBOutlet weak var mainView: UIView!

    @IBOutlet weak var timer: UILabel!

    @IBOutlet weak var circleOrange: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer.isHidden = false
        circleOrange.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func didGamePass(){
        timer.isHidden = true
        circleOrange.isHidden = true
        
        statusLabel.text = "Pass"
		mainView.backgroundColor = UIColor(rgb : 0xDB0E0E)

    }
    
    func didGameWin(){
        timer.isHidden = true
        circleOrange.isHidden = true
        
		mainView.backgroundColor = UIColor(rgb : 0x489F00)
        statusLabel.text = "Correct"

    }
    
    func didGameWait(msg: String) {
        mainView.backgroundColor = UIColor(rgb : 0xFF8621)
        statusLabel.text = msg
    }
    
    func setTime(time : Int){
        timer.text = "\(time)"
    }

}

extension UIColor {
	convenience init(red: Int, green: Int, blue: Int) {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")
		
		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	}
	
	convenience init(rgb: Int) {
		self.init(
			red: (rgb >> 16) & 0xFF,
			green: (rgb >> 8) & 0xFF,
			blue: rgb & 0xFF
		)
	}
}
