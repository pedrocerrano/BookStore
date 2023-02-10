//
//  BookListTableViewController.swift
//  BookStore
//
//  Created by iMac Pro on 2/9/23.
//

import UIKit

class BookListTableViewController: UITableViewController {

    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    } //: DidLOAD
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    } //: WillAPPEAR

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookController.sharedInstance.books.count
    } //: #ROWS
//
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 55
//    } //: ROW HEIGHT
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        let bookIndex = BookController.sharedInstance.books[indexPath.row]
        cell.updateView(with: bookIndex)

        return cell
    } //: CONFIG CELL


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteThisBook = BookController.sharedInstance.books[indexPath.row]
            BookController.sharedInstance.deleteBook(bookToDelete: deleteThisBook)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //: DELETE CELL
    } //: EDIT STYLE
    


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let index = tableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? BookDetailVC {
                    let bookToPass = BookController.sharedInstance.books[index.row]
                    destinationVC.bookReceiver = bookToPass
                }
            } //: INDEX
        } //: IDENTIFIER
    } //: SEGUE
    
} //: CLASS
