//
//  AVDebugger+Helpers.swift
//  AVSQLDebugger
//
//  Created by Umesh.
//  Copyright © 2019 Umesh. All rights reserved.
//

import Foundation
import Criollo

extension AVDebugger {
    /*
     * Server Status Listners
     */
    internal func checkStatus() throws {
        var serverError:NSError?
        if (self.server.startListening(&serverError, portNumber: portNumber, interface: nil) ) {
            // Get server ip address
            let address = SystemInfoHelper.ipAddress()
            // Set the base url. This is only for logging
            guard let baseURL = URL(string: "http\(self.server.isSecure ? "s" :"")://\(address):\(portNumber)") else { throw ServerError.invalidBaseUrl(msg: "Base Url is failed to Creted") }
            
            print("------------------------------------------------------")
            print("🎉 Server is up and running on port: \(portNumber) 🎉")
            print("🎉 Copy and paste this url to your local browser. 🎉")
            print("🚀🚀🚀")
            print("\(baseURL)/index.html")
            print("🚀🚀🚀")
            print("------------------------------------------------------")
            
        } else {
            print("Failed to start HTTP server. \(serverError!.localizedDescription)")
        }
    }
    
    public func server(_ server: CRServer, didAccept connection: CRConnection) {
        self.delegate?.server(server, didAccept: connection)
        
        #if DEBUG
            print(" * Accepted connection from \(connection.remoteAddress):\(connection.remotePort)")
        #endif
    }
    
    public func server(_ server: CRServer, didClose connection: CRConnection) {
        self.delegate?.server(server, didClose: connection)
        
        #if DEBUG
            print(" * Disconnected \(connection.remoteAddress):\(connection.remotePort)")
        #endif
    }
    
    public func server(_ server: CRServer, didFinish request: CRRequest) {
        SystemInfoHelper.addRequest()
        self.delegate?.server(server, didFinish: request)
    }
    
    public func stopListingServer() {
        self.server.stopListening()
    }
}
