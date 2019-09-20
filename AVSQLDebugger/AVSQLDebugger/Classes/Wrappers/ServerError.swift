//
//  ServerError.swift
//  AVSQLDebugger
//
//  Created by Umesh.
//  Copyright © 2019 Umesh. All rights reserved.
//

import Foundation

/*
 * Error Handling for Server
 */
enum ServerError: Error {
    case invalidBaseUrl(msg: String)
    case failed(msg: String)
    case success
}

/*
 * SQLite Errors
 */
enum SQLiteError: Error {
    case openDatabase(message: String)
    case prepare(message: String)
    case step(message: String)
    case bind(message: String)
}

enum SQLiteStatementError: Error {
    case parseQuery, unknown, tableNotFound
}
