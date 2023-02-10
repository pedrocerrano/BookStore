//
//  Book.swift
//  BookStore
//
//  Created by iMac Pro on 2/9/23.
//

import Foundation

class Book {
    var author: String
    var title: String
    var lastUpdated: Date
    var rating: Double
    var synopsis: String
    
    init(author: String, title: String, lastUpdated: Date = Date(), rating: Double, synopsis: String) {
        self.author = author
        self.title = title
        self.lastUpdated = lastUpdated
        self.rating = rating
        self.synopsis = synopsis
    } //: MEMBER-WISE INITIALIZER
    
} //: CLASS


extension Book: Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.lastUpdated == rhs.lastUpdated
    } //: EQUALtoSELF
    
} //: EXTENSION
