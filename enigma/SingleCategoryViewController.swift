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
	



