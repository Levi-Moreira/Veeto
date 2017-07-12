//
//  ViewController.swift
//  VeetoApp
//
//  Created by IFCE on 03/07/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import UIKit
import SCLAlertView

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

    @IBAction func didTapSettings(_ sender: UIButton) {
        let appearance = SCLAlertView.SCLAppearance(
            showCircularIcon: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        let alertViewIcon = UIImage(named: "settings") //Replace the IconImage text with the image name
//        alertView.showInfo("Custom icon", subTitle: "This is a nice alert with a custom icon you choose", circleIconImage: alertViewIcon)
        let view = UIView(frame: CGRect(x: 0, y: 0,width: 500,height: 500))
        view.backgroundColor = .red
        
        alertView.customSubview = view
        
        
        alertView.showTitle(
            "Settings", // Title of view
            subTitle: "", // String of view
            duration: 0.0, // Duration to show before closing automatically, default: 0.0
            completeText: "Done", // Optional button value, default: ""
            style: .success, // Styles - see below.
            colorStyle: 0x8601E6,
            colorTextButton: 0xFFFFFF,
            circleIconImage: alertViewIcon
        )
        
        
    }

}

