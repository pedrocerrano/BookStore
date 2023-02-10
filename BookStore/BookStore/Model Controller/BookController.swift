//
//  BookController.swift
//  BookStore
//
//  Created by iMac Pro on 2/9/23.
//

import Foundation

class BookController {
    
    // SINGLETON
    static let sharedInstance = BookController()
    // SOURCE OF TRUTH
    var books: [Book] = []
    
    
    // CRUD
    //MARK: - CREATE
    func createBook(author: String, title: String, rating: Double, synopsis: String) {
        let newBook = Book(author: author, title: title, rating: rating, synopsis: synopsis)
        books.append(newBook)
        
        save()
    } //: func CREATE
    
    
    //MARK: - UPDATE
    func updateBook(bookToUpdate: Book, newAuthor: String, newTitle: String, newRating: Double, newSynopsis: String) {
        bookToUpdate.author     = newAuthor
        bookToUpdate.title      = newTitle
        bookToUpdate.rating     = newRating
        bookToUpdate.synopsis   = newSynopsis
        
        save()
    } //: func UPDATE
    
    
    //MARK: - DELETE
    func deleteBook(bookToDelete: Book) {
        guard let index = books.firstIndex(of: bookToDelete) else { return }
        books.remove(at: index)
        
        save()
    } //: func DELETE
    
    
    // PERSISTENCE
    //MARK: - SAVE
    func save() {
        
    } //: SAVE
    
    
    //MARK: - LOAD
    func load() {
        
    } //: LOAD
    
} //: CLASS
