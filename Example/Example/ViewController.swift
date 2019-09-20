//
//  ViewController.swift
//  Example
//
//  Created by Umesh.
//  Copyright © 2019 Umesh. All rights reserved.
//

import UIKit
import CoreData

enum CoreDataError : Error {
    case count(_ msg: String)
    case store(_ msg: String)
}

class ViewController: UIViewController {

    @IBOutlet weak var nameOutlet: UITextField!
    
    /// For main queue use only, simple rule is don't access it from any queue other than main!!!
    var managedContext: NSManagedObjectContext { return AppDelegate.shared.persistentContainer.viewContext }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func saveItemInCoreData(_ name:String) throws {
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        let entityObject = NSManagedObject(entity: entity, insertInto: managedContext) as! User
        
        guard let ID:Int = getCount() else { throw CoreDataError.count("Count is not available") }
        let myId = ID
        entityObject.id = Int16(myId)
        entityObject.name = name
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            throw CoreDataError.store("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func saveItemInAccountCoreData(_ name:String) throws {
        let entity = NSEntityDescription.entity(forEntityName: "Account", in: managedContext)!
        let entityObject = NSManagedObject(entity: entity, insertInto: managedContext) as! Account
        
        guard let ID:Int = getCount() else { throw CoreDataError.count("Count is not available") }
        let myId = ID
        entityObject.id = Int16(myId)
        entityObject.accountName = name
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            throw CoreDataError.store("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getCount() -> Int? {
        let feedDetailFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let feedDetails = try managedContext.fetch(feedDetailFetch) as? [User]
            
            guard let data = feedDetails, data.count > 0 else {
                return nil
            }
            return data.count
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    @IBAction func SaveDB(_ sender: UIButton) {
        guard let text = nameOutlet.text else { return }
        do {
            try saveItemInCoreData(text)
            try saveItemInAccountCoreData(text)
        }catch let err {
            print(err)
        }
        
    }
}

