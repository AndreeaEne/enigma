//
//  ViewController.swift
//  enigma
//
//  Created by Andreea-Daniela Ene on 07/07/16.
//  Copyright © 2016 Andreea-Daniela Ene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var signInButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		signInButton.layer.borderColor = UIColor.whiteColor().CGColor
		signInButton.layer.borderWidth = 1.5
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
 
	// TODO: Send sign up credentials to next view
//	@IBAction func signInButton(sender: AnyObject) {
//		performSegueWithIdentifier("goToCategory", sender: nil)
//	}
}

