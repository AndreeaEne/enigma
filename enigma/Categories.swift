//
//  Categories.swift
//  enigma
//
//  Created by Andreea-Daniela Ene on 09/07/16.
//  Copyright © 2016 Andreea-Daniela Ene. All rights reserved.
//

import UIKit

struct Categories {
 
	var name:String
	var imageName:String
	var image: UIImage {
		get {
			return UIImage(named: imageName)!
		}
	}
 
}


