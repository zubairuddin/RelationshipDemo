//
//  ViewController.swift
//  RelationshipDemo
//
//  Created by Zubair on 20/10/18.
//  Copyright © 2018 applligent. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func authorsTapped(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "AuthorsViewController") as! AuthorsViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func booksTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BooksViewController") as! BooksViewController
        navigationController?.pushViewController(vc, animated: true)

    }
}

