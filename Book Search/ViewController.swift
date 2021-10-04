//
//  ViewController.swift
//  Search Book By Author
//
//  Created by fyz on 10/27/20.
//  Copyright © 2020 Feyza Topgul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var bookSearchImage: UIImageView!
    @IBOutlet weak var searchField: UITextField!
    
    var searchKeyword:String = ""
    private var bookUrl = ""
    //private var bestSellerUrl = ""
    private var imageUrl = ""
    var books = [Item] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        let backButtonImage = UIImage(named: "BackButton")
        self.navigationController?.navigationBar.backIndicatorImage = backButtonImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        }

    @IBAction func searchBooksButton(_ sender: Any) {
        searchKeyword = searchField.text ?? ""
        bookUrl = "https://www.googleapis.com/books/v1/volumes?q='inauthor:\(searchKeyword) or intitle:\(searchKeyword)'&maxResults=20&key=YOUR_GOOGLE_BOOKS_API_KEY"
        getBooks()
    }
    func getBooks() {
        guard let encodedUrl = bookUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let url = URL(string:encodedUrl)
        guard let requestUrl = url else { fatalError() }
        
        let request = URLRequest(url: requestUrl)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                DispatchQueue.main.async{
                    print("Error took place \(error)")
                    return}
            }
            
            if let data = data {
                let decoder = JSONDecoder()
            
                do {
                    let searchedBooks = try decoder.decode(Book.self, from: data)
                DispatchQueue.main.async {
                    self.books = searchedBooks.items
                    self.performSegue(withIdentifier: "showBooks", sender: self)
                    }

                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBooks"{
            if let tableViewController = segue.destination as? TableViewController {
                tableViewController.searchedBooks = books
                tableViewController.imageUrl = imageUrl
            }
            
        }

        
    }
    
}

