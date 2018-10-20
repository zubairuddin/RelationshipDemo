//
//  BooksViewController.swift
//  RelationshipDemo
//
//  Created by Zubair on 20/10/18.
//  Copyright © 2018 applligent. All rights reserved.
//

import UIKit
import CoreData

class BooksViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var arrBooks = [Book]()
    @IBOutlet weak var tblBooks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllBooks()
    }
    
    
    func getAllBooks() {
        
        let context  = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
        
        do  {
            try arrBooks = context.fetch(fetchRequest)
            tblBooks.reloadData()
        }
        catch {
            
        }
    }
    @IBAction func addBooksTapped(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddBookViewController") as! AddBookViewController
        navigationController?.pushViewController(vc, animated: true)

    }
    
}

extension BooksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBooks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BooksCell", for: indexPath) as! BooksCell
        
        let book = arrBooks[indexPath.row]
        cell.lblBookName.text = book.name
        cell.lblAuthorName.text = book.author?.name
        
        return cell
    }
}
