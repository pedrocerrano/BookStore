//
//  BookDetailVC.swift
//  BookStore
//
//  Created by iMac Pro on 2/9/23.
//

import UIKit

class BookDetailVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var bookTitleTextField: UITextField!
    @IBOutlet weak var bookAuthorTextField: UITextField!
    @IBOutlet weak var bookRatingTextField: UITextField!
    @IBOutlet weak var bookSynopsisTextView: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    
    
    //MARK: - PROPERTIES
    var bookReceiver: Book?
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        configureButtonView()
    } //: DidLOAD
    

    //MARK: - ACTIONS
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title     = bookTitleTextField.text,
              let author    = bookAuthorTextField.text,
              let rating    = bookRatingTextField.text,
              let synopsis  = bookSynopsisTextView.text else { return }
        
        if let book = bookReceiver {
            BookController.sharedInstance.updateBook(bookToUpdate: book, newAuthor: author, newTitle: title, newRating: Double(rating) ?? 0, newSynopsis: synopsis)
        } else {
            BookController.sharedInstance.createBook(author: author, title: title, rating: Double(rating) ?? 0, synopsis: synopsis)
        } //: CONDITIONAL
        
        navigationController?.popViewController(animated: true)
    } //: SAVE TAPPED
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        resetView()
    } //: CLEAR TAPPED

    
    //MARK: - HELPER FUNCTIONS
    func updateView() {
        guard let bookReceiver = bookReceiver else { return }
        bookTitleTextField.text     = bookReceiver.title
        bookAuthorTextField.text    = bookReceiver.author
        bookRatingTextField.text    = "\(bookReceiver.rating) / 10"
        bookSynopsisTextView.text   = bookReceiver.synopsis
    } //: UPDATE HELPER
    
    
    func resetView() {
        bookTitleTextField.text     = ""
        bookAuthorTextField.text    = ""
        bookRatingTextField.text    = ""
        bookSynopsisTextView.text   = ""
    } //: CLEAR HELPER
    
    
    func configureButtonView() {
        clearButton.titleLabel?.font    = UIFont.boldSystemFont(ofSize: 17)
        clearButton.tintColor           = .white
        clearButton.backgroundColor     = .systemGray3
        clearButton.layer.cornerRadius  = 10
        clearButton.layer.borderWidth   = 1
        clearButton.layer.borderColor   = UIColor.blue.cgColor
    }

} //: CLASS


extension BookDetailVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }

} //: EXTENSION
