import Foundation

struct Book: CustomStringConvertible, Codable {
    let title: String
    let author: String
    let genre: String
    let length: String
    
    var description: String {
        return "\(title) is written by \(author) in the \(genre) genre and is \(length) pages long"
    }
	
	static var archiveURL: URL {
		let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
		let archiveURL = documentsDirectory.appendingPathComponent("books").appendingPathExtension("plist")
		return archiveURL
	}
	
	static func saveToFile(books: [Book]){
		let encoder = PropertyListEncoder()
		do{
			let encodedBooks = try? encoder.encode(books)
			try encodedBooks?.write(to: archiveURL)
		}catch{
			print("error \(error)")
		}
	}
	
	static func loadFromFile() -> [Book]? {
		guard let booksData = try? Data(contentsOf: archiveURL) else {
			return nil
		}
		print(archiveURL)
		do{
			let decodedBooks = try PropertyListDecoder().decode([Book].self, from: booksData)
			return decodedBooks
		} catch{
			print("Error decodind Emojis: \(error)")
			return nil
		}
	}
}

