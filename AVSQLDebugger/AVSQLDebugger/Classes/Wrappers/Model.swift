//
//  Model.swift
//  AVSQLDebugger
//
//  Created by Umesh.
//  Copyright © 2019 Umesh. All rights reserved.
//

import Foundation

struct DataType {
    static let BOOLEAN = "boolean"
    static let INTEGER = "integer"
    static let REAL = "real"
    static let TEXT = "text"
    static let LONG = "long"
    static let FLOAT = "float"
    static let STRING_SET = "string_set"
}

struct TableDataResponse {
    
    var tableInfos = Array<TableInfo>()
    var isSuccessful:Bool = false
    var rows = Array<Any>()
    var error:String?
    var isEditable:Bool = false
    var isSelectQuery:Bool = false
    
    struct TableInfo {
        public var title:String?
        public var isPrimary:Bool = false
    }
    
    struct ColumnData {
        public var dataType:String?
        public var value:Any?
    }
}

public struct Response {
    public var rows = Array<Any>()
    public var columns = Array<String>()
    public var isSuccessful:Bool = false
    public var dbVersion:Int = 0
    public var error:String = ""
}
