//
//  Account+CoreDataProperties.swift
//  Example
//
//  Created by Umesh
//  Copyright © 2019 Umesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var id: Int16
    @NSManaged public var accountName: String?

}
