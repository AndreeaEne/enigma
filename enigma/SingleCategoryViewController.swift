//
//  SingleCategoryViewController.swift
//  enigma
//
//  Created by Andreea-Daniela Ene on 09/07/16.
//  Copyright © 2016 Andreea-Daniela Ene. All rights reserved.
//

import UIKit
import Foundation

class SingleCategoryViewController: UIViewController//, UITableViewDataSource, UITableViewDelegate
{

	@IBOutlet weak var NavigationItem: UINavigationItem!
	var enigmas:[Enigma] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	
//	func getJSON(currentTitle: String) {
//		
//		let url = NSBundle.mainBundle().URLForResource("Data/" + currentTitle, withExtension: "json")
//		let data = NSData(contentsOfURL: url!)
//		
//		do {
//			let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
//			if let dictionary = object as? [String: AnyObject] {
//				readJSONObject(dictionary)
//
//			}
//		} catch {
//			// Handle Error
//		}
//		
//	}
	
//	func readJSONObject(object: [String: AnyObject]) {
	
//		let allInfo = object["selection1"] as! [[String: AnyObject]]
//		for info in allInfo {
//			allEnigmas.append(Enigma(dict: info))
//			if (info["hint"] as? [String]) != nil {
//				allEnigmas.append(Info(description: info["desc"] as! String, hint: info["hint"] as! String, answer: info["answer"] as! String, title: info["title"] as! String))
//			}
//			else {
//				allEnigmas.append(Info(description: info["desc"] as! String, hint:"", answer: info["answer"] as! String,title: info["title"] as! String))
//			}
//		}
//	}
	
	// MARK: - Table view dataSource methods
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return enigmas.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
		
		let enigma = enigmas[indexPath.row]
		cell.textLabel?.text = enigma.title
		
		return cell
	}

}
	



