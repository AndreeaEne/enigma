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
	
	var data:[Categories] = [Categories]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		Fabric.with([Crashlytics.self])
		
		loadData()
    }
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
    // MARK: - Table view dataSource methods

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
			
		let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier")! as UITableViewCell
			
		let categories = data[indexPath.row]
			
		cell.textLabel?.text = categories.name
			
		cell.imageView?.image = categories.image
		
		return cell
	}
	
	// MARK:- TabvleView Delegate methods
		
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 60.0
	}
	
	
	//MARK:- Populate data
	
	func loadData() -> [Categories] {
		
		data.append(Categories(name:"Cryptography",imageName:"Categories/cryptography"))
		data.append(Categories(name:"Math", imageName:"Categories/math"))
		data.append(Categories(name:"Mystery", imageName:"Categories/mystery"))
		data.append(Categories(name:"Riddle", imageName:"Categories/riddle"))
		data.append(Categories(name:"Science", imageName:"Categories/science"))
		data.append(Categories(name:"Series", imageName:"Categories/series"))
		data.append(Categories(name:"Situation", imageName:"Categories/situation"))
		data.append(Categories(name:"Trick", imageName:"Categories/trick"))
		data.append(Categories(name:"Trivia", imageName:"Categories/trivia"))
		
		return data
	}
	
	//MARK:- Prepare Segue
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "goToCategory" {
			let cell = sender as! UITableViewCell
			let selectedRow = tableView.indexPathForCell(cell)?.item
			let detailViewController:SingleCategoryViewController = segue.destinationViewController as! SingleCategoryViewController
			
			detailViewController.NavigationItem.title = data[selectedRow!].name
		}
	}

	@IBAction func showInfo(sender: AnyObject) {
		let alertController = UIAlertController(title: "Hey there!", message: "With over 20,000 brain teasers, riddles, logic problems, quizzes and mind puzzles submitted and ranked by users like you, Braingle has the largest collection anywhere on the internet. Our large array of unique online multiplayer games will keep you entertained for hours, and if you want to improve your brain, check out the Mentalrobics section. If you crave a brain teaser, mind puzzle, riddle or game, we are the place to get it. Increase your creativity, boost learning and become a better person at Braingle. Get ready to have your brain tangled!", preferredStyle: .Alert)
		
		let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
		alertController.addAction(defaultAction)
		
		presentViewController(alertController, animated: true, completion: nil)
	}
	
}
