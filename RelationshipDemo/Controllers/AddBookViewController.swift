//
//  AddBookViewController.swift
//  RelationshipDemo
//
//  Created by Zubair on 20/10/18.
//  Copyright © 2018 applligent. All rights reserved.
//

import UIKit
import CoreData
class AddBookViewController: UIViewController {

    @IBOutlet weak var viewPicker: UIView!
    @IBOutlet weak var txtBookName: UITextField!
    @IBOutlet weak var txtAuthorName: UITextField!
    @IBOutlet weak var pickerAuthors: UIPickerView!
    @IBOutlet weak var viewPickerBottomConstraint: NSLayoutConstraint!
    
    var arrAuthors = [Author]()
    
    var selectedAuthor: Author?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        getAllAuthors()
    }
    
    func getAllAuthors() {
        
        let context  = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Author> = Author.fetchRequest()
        
        do  {
            try arrAuthors = context.fetch(fetchRequest)
            pickerAuthors.reloadAllComponents()
        }
        catch {
            
        }
    }

    @IBAction func saveBook(_ sender: UIButton) {
        let context  = appDelegate.persistentContainer.viewContext
        let bookObject = Book(context: context)
        
        bookObject.name = txtBookName.text!
        bookObject.author = selectedAuthor
        
        do {
            try context.save()
            print("Book Saved successfully!")
            navigationController?.popViewController(animated: true)
        }
        catch {
            
        }
    }
    @IBAction func selectAuthorTapped(_ sender: UIButton) {
        showHideAuthorPicker(isShow: true)
    }
    @IBAction func cancelTapped(_ sender: UIButton) {
        showHideAuthorPicker(isShow: false)
    }
    @IBAction func doneTapped(_ sender: UIButton) {
        showHideAuthorPicker(isShow: false)
        guard let author = selectedAuthor else {
            return
        }
        
        txtAuthorName.text = author.name
    }
    
    func showHideAuthorPicker(isShow: Bool) {
        if isShow {
            viewPickerBottomConstraint.constant = 0
        }
        else {
            viewPickerBottomConstraint.constant =  -(viewPicker.frame.size.height)
        }
    }
}

extension AddBookViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAuthor = arrAuthors[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let author = arrAuthors[row]
        return author.name
    }
}
extension AddBookViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrAuthors.count
    }
    
}
