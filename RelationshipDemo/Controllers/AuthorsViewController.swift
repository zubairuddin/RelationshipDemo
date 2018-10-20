//
//  AuthorsViewController.swift
//  RelationshipDemo
//
//  Created by Zubair on 20/10/18.
//  Copyright © 2018 applligent. All rights reserved.
//

import UIKit
import CoreData

class AuthorsViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var arrAuthors = [Author]()
    
    @IBOutlet weak var tblAuthors: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllAuthors()
    }
    
    func getAllAuthors() {
        
        let context  = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Author> = Author.fetchRequest()
        
        do  {
           try arrAuthors = context.fetch(fetchRequest)
            tblAuthors.reloadData()
        }
        catch {
            
        }
    }
    @IBAction func addAuthorTapped(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddAuthorViewController") as! AddAuthorViewController
        navigationController?.pushViewController(vc, animated: true)

    }
}

extension AuthorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAuthors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorCell", for: indexPath) as! AuthorCell
        
        let author = arrAuthors[indexPath.row]
        
        cell.lblAuthorName.text = author.name
        
        if let numberOfBooks = author.books?.count {
            cell.lblNumberOfBooks.text = "\(numberOfBooks)"
        }
    
        return cell
    }
}
