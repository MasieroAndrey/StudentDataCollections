//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by amasiero on 16/03/21.
//

import UIKit

class BookTableViewCell: UITableViewCell {

	@IBOutlet weak var labelTitle: UILabel!
	@IBOutlet weak var labelAuthor: UILabel!
	@IBOutlet weak var labelGener: UILabel!
	@IBOutlet weak var labelLength: UILabel!
	
	func update(book: Book){
		labelTitle.text = book.title
		labelAuthor.text = book.author
		labelGener.text = book.genre
		labelLength.text = book.length + " Pages"
	}
	

}
