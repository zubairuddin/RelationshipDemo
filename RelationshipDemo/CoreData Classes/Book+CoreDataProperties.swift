//
//  Book+CoreDataProperties.swift
//  RelationshipDemo
//
//  Created by Zubair on 20/10/18.
//  Copyright © 2018 applligent. All rights reserved.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var name: String
    @NSManaged public var author: Author?

}
