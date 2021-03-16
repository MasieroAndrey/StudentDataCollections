//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by amasiero on 11/03/21.
//

import UIKit

class AthleteFormViewController: UIViewController {

	@IBOutlet weak var txtName: UITextField!
	@IBOutlet weak var txtAge: UITextField!
	@IBOutlet weak var txtLeague: UITextField!
	@IBOutlet weak var txtTeam: UITextField!
	
	@IBAction func saveButton(_ sender: Any) {
		guard let name = txtName.text,
			  let ageString = txtAge.text,
			  let age = Int(ageString),
			  let league = txtLeague.text,
			  let team = txtTeam.text else { return }
		
		athlete = Athlete(name: name, age: age, league: league, team: team)
		
		performSegue(withIdentifier:"unwindToAtlheteTableViewController", sender:sender)
	}
	
	var athlete: Athlete?
	
	init?(coder: NSCoder, athlete: Athlete?){
		self.athlete = athlete
		super.init(coder: coder)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func updateView() {
		guard let athlete = athlete else {
			return
		}
		
		txtName.text = athlete.name
		txtAge.text = String(athlete.age)
		txtTeam.text = athlete.team
		txtLeague.text = athlete.league
		
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		updateView()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
