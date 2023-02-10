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
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } //: DidLOAD
    

    //MARK: - ACTIONS
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} //: CLASS
