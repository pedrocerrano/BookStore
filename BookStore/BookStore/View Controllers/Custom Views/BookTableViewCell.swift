//
//  BookTableViewCell.swift
//  BookStore
//
//  Created by iMac Pro on 2/9/23.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    //MARK: - OUTLETS
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookAuthorLabel: UILabel!
    @IBOutlet weak var bookRatingLabel: UILabel!
    
    
    //MARK: - FUNCTIONS
    func updateView(with bookToDisplay: Book) {
        bookTitleLabel.text     = bookToDisplay.title
        bookAuthorLabel.text    = bookToDisplay.author
        bookRatingLabel.text    = "\(bookToDisplay.rating) / 10"
    }
    
} //: CLASS
