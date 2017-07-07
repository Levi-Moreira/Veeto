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

		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func didGamePass(){
        statusLabel.text = "Pass"
		mainView.backgroundColor = .red

    }
    
    func didGameWin(){
		mainView.backgroundColor = .green
        statusLabel.text = "Correct"

    }

}
