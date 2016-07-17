//
//  CategoryTableViewController.swift
//  enigma
//
//  Created by Andreea-Daniela Ene on 09/07/16.
//  Copyright © 2016 Andreea-Daniela Ene. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

class CategoriesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet var tableView: UITableView!
	
	let names = ["Cryptography", "Math", "Mystery", "Riddle", "Science", "Series", "Situation", "Trick", "Trivia"];
	var categories:[Category] = [Category]()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		Fabric.with([Crashlytics.self])
		
		// Populate data
		for name in names {
			categories.append(Category(name))
		}
    }
	

    // MARK: - Table view dataSource methods

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// Number of rows
		return categories.count
	}
	
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		// Load each row
		let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier")! as UITableViewCell

		let category = categories[indexPath.row]
		cell.textLabel?.text  = category.name
		cell.imageView?.image = category.image
		
		return cell
	}
	
	
	// MARK:- TabvleView Delegate methods
		
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		// Row height
		return 60.0
	}
	
//	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//		// On tap
//		
//		let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
//		
//		print("You selected cell \(currentCell.textLabel!.text)!")
//	
//		let ref = SingleCategoryViewController()
//		var enigmas = categories[indexPath.row].enigmas
//		
////		ref.selectedCateg = currentCell.textLabel!.text!
////		ref.getJSON((currentCell.textLabel?.text!.lowercaseString)!)
//		
////		print("You selected cell #\(indexPath.row)!")
//	}
	
	

	
	//MARK:- Prepare Segue
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "goToCategory" {
			let cell = sender as! UITableViewCell
			let selectedRow = tableView.indexPathForCell(cell)?.item
			let destination = segue.destinationViewController as! SingleCategoryViewController
			
			destination.NavigationItem.title = categories[selectedRow!].name // set title
			
		}
	}

	@IBAction func showInfo(sender: AnyObject) {
		let alertController = UIAlertController(title: "Hey there!", message: "With over 20,000 brain teasers, riddles, logic problems, quizzes and mind puzzles submitted and ranked by users like you, Braingle has the largest collection anywhere on the internet. Our large array of unique online multiplayer games will keep you entertained for hours, and if you want to improve your brain, check out the Mentalrobics section. If you crave a brain teaser, mind puzzle, riddle or game, we are the place to get it. Increase your creativity, boost learning and become a better person at Braingle. Get ready to have your brain tangled!", preferredStyle: .Alert)
		
		let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
		alertController.addAction(defaultAction)
		
		presentViewController(alertController, animated: true, completion: nil)
	}
	
}
