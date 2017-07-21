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
    

    func didGamePass(){
        statusLabel.text = "Pass"
		mainView.backgroundColor = UIColor(rgb : 0xb30000)

    }
    
    func didGameWin(){
		mainView.backgroundColor = UIColor(rgb : 0x489F00)
        statusLabel.text = "Correct"

    }
    
    func didGameWait(msg: String) {
        mainView.backgroundColor = UIColor(rgb : 0xFF8621)
        statusLabel.text = msg
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
