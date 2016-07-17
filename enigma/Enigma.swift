//
//  Enigma.swift
//  enigma
//
//  Created by Andreea-Daniela Ene on 13/07/16.
//  Copyright © 2016 Andreea-Daniela Ene. All rights reserved.
//

import UIKit

class Enigma {
	let title:String
	let description:String
	let hint:String
	let answer:String
	
	
	init(title: String, description: String, hint: String, answer: String) {
		self.title = title
		self.description = description
		self.hint = hint
		self.answer = answer
		
	}
	
	convenience init(dict: Dictionary<String, AnyObject>) {
		var hintVal = dict["hint"] as? String
		if (hintVal == nil) {
			hintVal = ""
		}
		
		self.init(title:	   dict["title"]  as! String,
				  description: dict["desc"]   as! String,
		          hint:        hintVal!,
				  answer:	   dict["answer"] as! String)
	}
	
//	convenience init(name: String) {
//		
//		
//		
//		do {
//			let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
//			let dictionary = object as! [String: String]
//			self.init(title:	   dictionary["title"]!,
//					  description: dictionary["desc"]!,
//			          hint:        dictionary["hint"]!,
//					  answer:	   dictionary["answer"]!)
//		} catch {
//			self.init(title: "Error", description: "error", hint: "error", answer: "error")
//			print("Failed to init Enigma: \(error)")
//		}
	}
