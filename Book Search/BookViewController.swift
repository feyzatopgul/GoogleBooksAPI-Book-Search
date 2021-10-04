//
//  BookViewController.swift
//  Search Book By Author
//
//  Created by fyz on 11/27/20.
//  Copyright © 2020 Feyza Topgul. All rights reserved.
//

import UIKit

class BookViewController: UIViewController {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var pageCountLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var bookTitle = ""
    var author = ""
    var publisher = ""
    var publishedDate = ""
    var pageCount = 0
    var bookDescription = ""
    var imageUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        titleLabel.text = bookTitle
        authorLabel.text = "Author: \(author)"
        publisherLabel.text = "Publisher: \(publisher)"
        publishedDateLabel.text = "Published Date: \(publishedDate)"
        pageCountLabel.text = "Page Count: \(pageCount)"
        descriptionLabel.text = "Description:"
        descriptionTextView.text = "\(bookDescription)"
        bookImage.load(urlString: imageUrl)

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

