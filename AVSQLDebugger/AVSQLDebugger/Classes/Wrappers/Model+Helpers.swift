//
//  Model+Helpers.swift
//  AVSQLDebugger
//
//  Created by Umesh.
//  Copyright © 2019 Umesh. All rights reserved.
//

import Foundation

extension TableDataResponse.TableInfo: CustomStringConvertible {
    public var description: String {
    
        let returnStr = """
        {
        "title":"\(title ?? "")",
        "isPrimary":\(isPrimary)
        }
        """
        return returnStr
    }
}

extension TableDataResponse.ColumnData: CustomStringConvertible {
    public var description: String {
        
        let returnStr = """
        {
        "dataType":"\(dataType ?? "")",
        "value": "\(value ?? "")"
        }
        """
        return returnStr
    }
}

extension TableDataResponse: CustomStringConvertible {
    public var description: String {
        
        let returnStr = """
        {
        "tableInfos":\(tableInfos.description),
        "isSuccessful":\(isSuccessful),
        "error": "\(error ?? "")",
        "rows": \(rows),
        "isEditable":\(isEditable),
        "isSelectQuery":\(isSelectQuery)
        }
        """
        return returnStr
    }
}

extension Response: CustomStringConvertible {
    public var description: String {
        
        let returnStr = """
        {
        "rows":\(rows),
        "columns":\(columns),
        "isSuccessful":\(isSuccessful),
        "dbVersion":\(dbVersion)
        }
        """
        
        return returnStr
    }
}
