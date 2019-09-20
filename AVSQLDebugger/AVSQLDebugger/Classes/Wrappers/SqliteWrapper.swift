//
//  SqliteWrapper.swift
//  MyTest
//
//  Created by Umesh on 28/03/19.
//  Copyright © 2019 Umesh. All rights reserved.
//

import Foundation
import SQLite3


class SQLiteDatabase {
    fileprivate let dbPointer: OpaquePointer?
    
    fileprivate init(dbPointer: OpaquePointer?) {
        self.dbPointer = dbPointer
    }
    
    deinit {
        sqlite3_close(dbPointer)
    }
    
    static func open(path: String) throws -> SQLiteDatabase {
        var db: OpaquePointer? = nil
        // 1
        if sqlite3_open(path, &db) == SQLITE_OK {
            // 2
            return SQLiteDatabase(dbPointer: db)
        } else {
            // 3
            defer {
                if db != nil {
                    sqlite3_close(db)
                }
            }
            
            if let errorPointer = sqlite3_errmsg(db) {
                let message = String.init(cString: errorPointer)
                throw SQLiteError.openDatabase(message: message)
            } else {
                throw SQLiteError.openDatabase(message: "No error message provided from sqlite.")
            }
        }
    }
    
    fileprivate var errorMessage: String {
        if let errorPointer = sqlite3_errmsg(dbPointer) {
            let errorMessage = String(cString: errorPointer)
            return errorMessage
        } else {
            return "No error message provided from sqlite."
        }
    }
}

extension SQLiteDatabase {
    func prepareStatement(sql: String) throws -> OpaquePointer? {
        var statement: OpaquePointer? = nil
        guard sqlite3_prepare_v2(dbPointer, sql, -1, &statement, nil) == SQLITE_OK else {
            throw SQLiteError.prepare(message: errorMessage)
        }
        
        return statement
    }
}

extension SQLiteDatabase {
    
    func showAllTables() -> Response? {
        let querySql = "SELECT name FROM sqlite_master WHERE type='table';"
        guard let queryStatement = try? prepareStatement(sql: querySql) else {
            return nil
        }
        
        defer {
            sqlite3_finalize(queryStatement)
        }
        var response = Response()
        while(sqlite3_step(queryStatement) == SQLITE_ROW){
            let tablename = String(cString: sqlite3_column_text(queryStatement,0))
            response.rows.append(tablename)
        }
        return response
    }
    
    func getTableData(tableName: String?, executeQuery:String? = nil) -> TableDataResponse? {
        
        var tableData = TableDataResponse()
        
        guard let table = tableName, let querySql = executeQuery else {
            return nil
        }
    
        let pragmaQuery = "PRAGMA table_info(" + table + ")"
        tableData.tableInfos = getTableInfo(pragmaQuery)
        
        
        guard let queryStatement = try? prepareStatement(sql: querySql) else {
            return nil
        }
        
        tableData.isSuccessful = true
        tableData.isSelectQuery = true
//        tableData.isEditable    = true
        tableData.rows = Array<Any>()
        
    
        defer {
            sqlite3_finalize(queryStatement)
        }
        
        let columnCount = sqlite3_column_count(queryStatement)
        
        while (sqlite3_step(queryStatement) == SQLITE_ROW){
            
            var row = Array<TableDataResponse.ColumnData>()
            var index:Int32 = 0
            
            while index < columnCount {
                let tablename = String(cString: sqlite3_column_text(queryStatement,index))
                var column = TableDataResponse.ColumnData()
                column.dataType = ""
                column.value = tablename
                row.append(column)
                
                index += 1
            }
            
            tableData.rows.append(row)
        }
        #if DEBUG
        print(tableData.description)
        #endif
        return tableData
    }
    
    func getTableInfo(_ pragmaQuery:String) -> Array<TableDataResponse.TableInfo> {
        
        var tableInfoList = Array<TableDataResponse.TableInfo>()
        
        guard let queryStatement = try? prepareStatement(sql: pragmaQuery) else {
            return []
        }
        
        defer {
            sqlite3_finalize(queryStatement)
        }
        
        
        while(sqlite3_step(queryStatement) == SQLITE_ROW){
            let tablename = String(cString: sqlite3_column_text(queryStatement,1))
            var tableinfo = TableDataResponse.TableInfo()
            tableinfo.title = tablename
            tableInfoList.append(tableinfo)
        }
        
        return tableInfoList
    }
    
    @discardableResult
    func executeQuery(_ query:String?) throws -> TableDataResponse? {
        
        guard let url = query else { throw SQLiteStatementError.unknown }
        let newUrl = url.components(separatedBy: "/query/")
        guard let parseQuery = newUrl.last else { throw SQLiteStatementError.parseQuery }
        
        guard let tableParser = parseQuery.uppercased().extractTableNameFromQuery().first else { throw SQLiteStatementError.tableNotFound}
        
        let tables = tableParser.components(separatedBy: " ")
        
        guard tables.count > 1 else { throw SQLiteStatementError.tableNotFound}
        
        let tableName = tables[1]
        return getTableData(tableName: tableName, executeQuery: parseQuery.uppercased())
    }
}
