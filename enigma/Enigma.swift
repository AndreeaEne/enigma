//
//  Enigma.swift
//  enigma
//
//  Created by Andreea-Daniela Ene on 13/07/16.
//  Copyright © 2016 Andreea-Daniela Ene. All rights reserved.
//

import UIKit

class Enigma {
	let title:       String
	let description: String
	let hint:		 String
	let answer:		 String
	
	init(title: String, description: String, hint: String, answer: String) {
		self.title = title
		self.description = description
		self.hint = hint
		self.answer = answer
	}
	
	convenience init(_ dict: Dictionary<String, AnyObject>) {
		// Some enigmas do not have a hint
		var hintVal = dict["hint"] as? String
		if (hintVal == nil) {
			hintVal = ""
		}
		
		self.init(title:	   dict["title"]  as! String,
				  description: dict["desc"]   as! String,
		          hint:        hintVal!,
				  answer:	   dict["answer"] as! String)
	}
}
