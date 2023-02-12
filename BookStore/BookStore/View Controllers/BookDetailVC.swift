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
    
    let picker = UIPickerView()
    let ratingInTenths: [Double] = Array(stride(from: 0, through: 10, by: 0.1))

    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        bookRatingTextField.inputView = picker
        picker.delegate = self
        picker.dataSource = self
        
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
        bookRatingTextField.text    = "\(bookReceiver.rating)"
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
        clearButton.layer.borderColor   = UIColor.systemBlue.cgColor
    }

} //: CLASS


extension BookDetailVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ratingInTenths.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%.1f", ratingInTenths[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bookRatingTextField.text = String(format: "%.1f", ratingInTenths[row])
    }

} //: EXTENSION
