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

    @IBOutlet weak var veetoLogo: UIImageView!
    let preferences = UserDefaults.standard
    
    let soundSettings = "soundSettings"
    let timeSettings = "timeSettings"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
         animateLogo()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
		return .landscape
	}
    @IBAction func animateSettings(_ sender: UIButton) {
        print("hoihoihohioih")
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

    @IBAction func didTapSettings(_ sender: UIButton) {
        
        
        let appearance = SCLAlertView.SCLAppearance(
           
            kTitleFont: UIFont(name: "Neon 80s", size: 26)!,
            kTextFont: UIFont(name: "Neon 80s", size: 16)!,
            kButtonFont: UIFont(name: "Neon 80s", size: 16)!,
             showCircularIcon: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        let alertViewIcon = UIImage(named: "settings") //Replace the IconImage text with the 
        
        
        let subview = UIView(frame: CGRect(x: 0, y: 0,width: 500,height: 550))
        
        
        let strokeTextAttributes = [
            NSForegroundColorAttributeName : UIColor.black,
            NSFontAttributeName : UIFont(name: "Neon 80s", size: 22.0)
            ] as [String : Any]
        
        let soundLabel = UILabel(frame: CGRect(x: 0,y: 15, width: 100,height: 25))
        
        
        soundLabel.attributedText = NSMutableAttributedString(string: "Sound", attributes: strokeTextAttributes)
        soundLabel.textAlignment = NSTextAlignment.center
        subview.addSubview(soundLabel)
        
        let switchView = UISwitch(frame: CGRect(x: 130, y: 15, width: 0, height: 25))
        
        switchView.onTintColor = UIColor(rgb: 0xba61ff)
    
    
        switchView.addTarget(self, action: #selector(didChangeSoundSettings), for: .valueChanged)
        
        if(preferences.bool(forKey: soundSettings)){
            switchView.isOn = true
        }else{
            switchView.isOn = false
        }
        
        subview.addSubview(switchView)
        
        let timeLabel = UILabel(frame: CGRect(x: 0,y: 77, width: 100,height: 25))
        timeLabel.attributedText = NSMutableAttributedString(string: "Time", attributes: strokeTextAttributes)
        timeLabel.textAlignment = NSTextAlignment.center
        subview.addSubview(timeLabel)
        
        
        let items = ["60", "90", "120"]
        let segmented = UISegmentedControl(items:items)
        segmented.frame = CGRect(x: 100,y: 72, width: 100,height: 30)
        
        segmented.tintColor = UIColor(rgb: 0xba61ff)
        
        segmented.addTarget(self, action: #selector(didChangeTimeSettings), for: .valueChanged)
    
        segmented.selectedSegmentIndex = preferences.integer(forKey: timeSettings)
        
        subview.addSubview(segmented)
        
        
        alertView.customSubview = subview
        
        
        alertView.showTitle(
            "Settings", // Title of view
            subTitle: "", // String of view
            duration: 0.0, // Duration to show before closing automatically, default: 0.0
            completeText: "Done", // Optional button value, default: ""
            style: .success, // Styles - see below.
            colorStyle: 0xba61ff,
            colorTextButton: 0xFFFFFF,
            circleIconImage: alertViewIcon
        )
    
    }
    
    
    func didChangeSoundSettings(sender: UISwitch!){
        
        if(sender.isOn){
            preferences.set(true, forKey: soundSettings)
        }else{
            preferences.set(false, forKey: soundSettings)
        }
        
    }
    
    @IBAction func animatePlay(_ sender: UIButton) {
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
  
    @IBAction func animateInfo(_ sender: UIButton) {
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
    
    func didChangeTimeSettings(sender: UISegmentedControl!){
        preferences.set(sender.selectedSegmentIndex, forKey: timeSettings)
    }
    
    func animateLogo() {
        veetoLogo.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        
        UIView.animate(withDuration: 5.0,
                       delay: 0,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 3.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self.self?.veetoLogo.transform = .identity
            },
                       completion: nil)

        
    }

}

