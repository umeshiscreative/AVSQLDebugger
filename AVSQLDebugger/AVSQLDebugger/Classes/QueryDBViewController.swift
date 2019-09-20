//
//  QueryDBViewController.swift
//  AVSQLDebugger
//
//  Created by Umesh
//
//

import Criollo


class QueryDBViewController: CRViewController {
    
    private var db: SQLiteDatabase!
    
    override func present(with request: CRRequest, response: CRResponse) -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let filePath = "\(path[0])/\(AVDebugger.sharedInstance.containerName).sqlite"
        
        let executeQuery = request.env["SCRIPT_NAME"]
        
        do {
            db = try SQLiteDatabase.open(path: filePath)
            
            #if DEBUG
                print("Successfully opened connection to database.")
            #endif
            
        } catch let err {
            print("Unable to open database. Verify that you created the directory described in the Getting Started section.\(err)")
        }
        
        do {
            if let res = try db.executeQuery(executeQuery) {
                self.vars["data"] = res.description
            }
        }catch let err {
            print("\(err)")
        }
        
        return super.present(with: request, response: response)
    }

}
