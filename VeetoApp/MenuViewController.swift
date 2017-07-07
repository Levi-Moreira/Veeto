//
//  ViewController.swift
//  VeetoApp
//
//  Created by IFCE on 03/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
		return .landscape
	}


}

