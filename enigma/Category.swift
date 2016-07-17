//
//  Categories.swift
//  enigma
//
//  Created by Andreea-Daniela Ene on 09/07/16.
//  Copyright © 2016 Andreea-Daniela Ene. All rights reserved.
//

import UIKit

class Category {
	let name:      String
	let imageName: String
	var image: UIImage {
		get {
			return UIImage(named: imageName)!
		}
	}
	var enigmas: [Enigma]
	
	init(_ name: String) {
		self.name = name
		// TODO figure out why xcode doesn't see thumbnails and JSONs (displays them as red)
		self.imageName = "Category Thumbnails/" + name.lowercaseString
		
		self.enigmas = []
		// Parse json
		let url = NSBundle.mainBundle().URLForResource("Category JSONs/" + name.lowercaseString, withExtension: "json")
		let enigmasBlob = NSData(contentsOfURL: url!)
		do {
			let json = try NSJSONSerialization.JSONObjectWithData(enigmasBlob!, options: .AllowFragments)
			let dictionary = json as! [String: [Dictionary<String, String>]] // { enigmas: [ {title, hint}, {title, hint} ]
			
			for dict in dictionary["enigmas"]! {
				self.enigmas.append(Enigma(dict))
			}
		} catch {
			print("Error parsing enigmas JSON for \(name): \(error)")
		}
	}
 
}


