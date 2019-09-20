//
//  HelloWorldViewController.swift
//  AVSQLDebugger
//
//  Created by Umesh
//
//

import Criollo


class GetTableDataViewController: CRViewController {
    
    private var db: SQLiteDatabase!
    
    override func present(with request: CRRequest, response: CRResponse) -> String {
        
        let tablename = request.query["pid"] ?? ""
        
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)
        let filePath = "\(path[0])/\(AVDebugger.sharedInstance.containerName).sqlite"
        
        do {
            db = try SQLiteDatabase.open(path: filePath)
            
            #if DEBUG
                print("Successfully opened connection to database.")
            #endif
            
            if let res = db.getTableData(tableName: tablename,executeQuery: "SELECT * FROM \(tablename);") {
                self.vars["data"] = res.description
            }else {
                self.vars["data"] = "{ error : No data found }"
            }
            
        } catch let err {
            print("Unable to open database. Verify that you created the directory described in the Getting Started section.\(err)")
        }
        
        
        return super.present(with: request, response: response)
    }
    
}
