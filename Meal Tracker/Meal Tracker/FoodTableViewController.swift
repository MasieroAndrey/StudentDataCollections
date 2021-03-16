//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by amasiero on 15/03/21.
//

import UIKit

class FoodTableViewController: UITableViewController {
	
	var meals: [Meal]{
		let breakfast = Meal(name: "breakfast", food: [breakfast1, breakfast2, breakfast3])
		let lunch = Meal(name: "Lunch", food: [lunchFoodMeat, lunchFoodChiken, lunchFoodFish])
		let dinner = Meal(name: "Dinner", food: [dinnerFoodCake, dinnerFoodPie, dinnerFoodPudding])
		
		
		return [breakfast, lunch, dinner]
	}
	var breakfast1 = Food(name: "Eggs", description: "Scrambled with bacon a frying pan")
	var breakfast2 = Food(name: "Hasgbrowns", description: "Cut potatoes then fry in oil until brown")
	var breakfast3 = Food(name: "Bacon", description: "Key food in all breakfast meals")
	
	var lunchFoodMeat = Food(name: "Sandwich", description: "Easy to fix. Always delicious")
	var lunchFoodChiken = Food(name: "Chips", description: "Put a few in the sandwich for enhanced flavor")
	var lunchFoodFish = Food(name: "Apple", description: "An apple a day keeps the doctor away")
	
	var dinnerFoodCake = Food(name: "Steak", description: "Everyone needs some food protein")
	var dinnerFoodPie = Food(name: "Potatoes", description: "Great addition to go along with steak")
	var dinnerFoodPudding = Food(name: "Brocolli", description: "Always finish out the food pyramid")
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
		
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections

		return meals.count
		
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
		
		return meals[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
		
		cell.textLabel?.text = "\(meals[indexPath.section].food[indexPath.row].name)"
		cell.detailTextLabel?.text = "\(meals[indexPath.section].food[indexPath.row].description)"
		
	
        return cell
    }
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return meals[section].name
	}
    

}
