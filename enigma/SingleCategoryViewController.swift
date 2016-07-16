//
//  SingleCategoryViewController.swift
//  enigma
//
//  Created by Andreea-Daniela Ene on 09/07/16.
//  Copyright © 2016 Andreea-Daniela Ene. All rights reserved.
//

import UIKit
import Foundation

class SingleCategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var NavigationItem: UINavigationItem!
	var AllData:[Info] = [Info]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		getJSON()
	}
	
	
	func getJSON() {
		let url = NSBundle.mainBundle().URLForResource("Data/math", withExtension: "json")
		let data = NSData(contentsOfURL: url!)

		
		do {
			let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
			if let dictionary = object as? [String: AnyObject] {
				readJSONObject(dictionary)

			}
		} catch {
			// Handle Error
		}
		
	}
	
	func readJSONObject(object: [String: AnyObject]) {
		
		let allInfo = object["selection1"] as! [[String: AnyObject]]
		for info in allInfo {
			if (info["hint"] as? [String]) != nil {
				AllData.append(Info(description: info["desc"] as! String, hint: info["hint"] as! String, answer: info["answer"] as! String, title: info["title"] as! String))
			}
			else {
				AllData.append(Info(description: info["desc"] as! String, hint:"", answer: info["answer"] as! String,title: info["title"] as! String))
			}
		}
		
		for test in AllData {
			print(test.title)
			print(test.answer)
			print(test.description)
			print(test.hint)
		}
		
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		var count = 0
//		for _ in AllData {
//			count += 1
//		}
//		
//		return count
		return AllData[Info]
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
		
		let categories = AllData[indexPath.row]
		
		cell.textLabel?.text = categories.title
		
		return cell
	}
}


