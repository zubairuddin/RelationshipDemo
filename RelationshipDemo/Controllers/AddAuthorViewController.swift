//
//  AddAuthorViewController.swift
//  RelationshipDemo
//
//  Created by Zubair on 20/10/18.
//  Copyright © 2018 applligent. All rights reserved.
//

import UIKit

class AddAuthorViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var txtAuthorName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAuthorTapped(_ sender: UIButton) {
        
        let context  = appDelegate.persistentContainer.viewContext
        let authorObject = Author(context: context)
        authorObject.name = txtAuthorName.text!
        
        do {
            try context.save()
            print("Author saved successfully!")
            navigationController?.popViewController(animated: true)
        }
        catch let error {
            print("An error occured while saving author: \(error.localizedDescription)")
        }
    }
    
}
