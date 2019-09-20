//
//  User+CoreDataProperties.swift
//  Example
//
//  Created by Umesh.
//  Copyright © 2019 Umesh. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?

}
