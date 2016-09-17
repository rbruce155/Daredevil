//
//  Dare+CoreDataProperties.swift
//  DareDevil
//
//  Created by Bruce on 9/16/16.
//  Copyright © 2016 Bruce. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Dare {

    @NSManaged var dangerRating: NSNumber?
    @NSManaged var dareDetails: String?
    @NSManaged var isCompleted: NSNumber?
    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var picture: NSData?
    @NSManaged var points: NSNumber?

}
