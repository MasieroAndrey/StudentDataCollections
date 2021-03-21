//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by amasiero on 16/03/21.
//

import UIKit

class BookFormTableViewController: UITableViewController {
	var book: Book?
	
	@IBOutlet weak var txtTitle: UITextField!
	@IBOutlet weak var txtAuthor: UITextField!
	@IBOutlet weak var txtGenre: UITextField!
	@IBOutlet weak var txtLength: UITextField!
	@IBOutlet weak var saveButton: UIButton!
	
	@IBAction func saveButtonTapped(_ sender: Any) {
		guard let title = txtTitle.text,
			  let author = txtAuthor.text,
			  let genre = txtGenre.text,
			  let length = txtLength.text else {return}
		
		
		book = Book(title: title, author: author, genre: genre, length: length)
		performSegue(withIdentifier: "UnwindToBookTable", sender: self)
	}
	
	
	
	
	init?(coder: NSCoder, book: Book?) {
		self.book = book
		super.init(coder: coder)
	}
	
	required init?(coder: NSCoder) {
		self.book = nil
		super.init(coder: coder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		updateView()
	}
	
	func updateView() {
		guard let book = book else {return}
		
		txtTitle.text = book.title
		txtAuthor.text = book.author
		txtGenre.text = book.genre
		txtLength.text = book.length
	}
	
	
	
	
}
