//
//  ProtocolsReprsentable.swift
//  AVSQLDebugger
//
//  Created by Umesh.
//  Copyright © 2019 Umesh. All rights reserved.
//

import Foundation
import Criollo

/*
 * Protocols for Server Status
 */

public protocol AVDebuggerProtocol:class {
    func server(_ server: CRServer, didAccept connection: CRConnection)
    func server(_ server: CRServer, didClose connection: CRConnection)
    func server(_ server: CRServer, didFinish request: CRRequest)
}

/*
 * Default Implementation for Protocols
 */

public extension AVDebuggerProtocol {
    func server(_ server: CRServer, didAccept connection: CRConnection) {}
    func server(_ server: CRServer, didClose connection: CRConnection) {}
    func server(_ server: CRServer, didFinish request: CRRequest) {}
}
