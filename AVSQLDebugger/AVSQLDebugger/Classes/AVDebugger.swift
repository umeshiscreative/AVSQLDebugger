//
//  AVDebugger.swift
//  AVSQLDebugger
//
//  Created by Umesh on 01/04/19.
//  Copyright © 2019 Umesh. All rights reserved.
//

import Foundation
import Criollo

public class AVDebugger : NSObject, CRServerDelegate {
    
    var server: CRHTTPServer!
    weak var delegate: AVDebuggerProtocol? = nil
    
    private var _port: UInt?
    /*
     * Port For App Server Run
     */
    public var portNumber:UInt {
        get {
            return _port ?? 10781
        }
        set {
            _port = newValue
        }
    }
    
    private var name: String?
    
    /*
     * DB Container name
     */
    public var containerName: String {
        return name ?? ""
    }
    
    public static var sharedInstance: AVDebugger = {
        let instance = AVDebugger()
        return instance
    }()
    
    private override init() {}
    
    public func config(with delegate: AVDebuggerProtocol, containerName: String, port: UInt = 10781) {
        self.delegate = delegate
        self.name = containerName
        self._port = port
        self.server = CRHTTPServer(delegate:self)
        setMountsUrls()
        setUpUrls()
        do {
            try checkStatus()
        }catch let err {
            print(err)
        }
        
    }
    
    private var dataDic : Dictionary<String,String> {
        return [
            "index": "html",
            "app"  : "js",
            "jquery.min" : "js",
            "bootstrap.min": "js",
            "dataTables.altEditor.free": "js",
            "dataTables.buttons.min"    : "js",
            "dataTables.select.min"     : "js",
            "dataTables.responsive.min" : "js",
            "custom"                    : "css",
            "jquery.dataTables.min"     : "css",
            "buttons.dataTables.min"    : "css",
            "select.dataTables.min"     : "css",
            "responsive.dataTables.min" : "css",
            "jquery.dataTables.min_"    : "js",
            "bootstrap.min_"            : "css"
        ]
    }
    
    
    private func getFilepath(name:String, type:String = "js") -> String {
        guard let path = Bundle(for: AVDebugger.self).path(forResource: name, ofType: type) else {
            return ""
        }
        return path
    }
    
    private func setMountsUrls(){
        for (key,value) in dataDic {
            server.mount("/\(key.removeUnderScore()).\(value)",
                            fileAtPath:
                                getFilepath(name: key.removeUnderScore(), type: value))
        }
    }
    
    private func setUpUrls(){
        self.server.add("/getDBTableList", viewController: GetDBViewController.self, withNibName: String(describing: GetDBViewController.self), bundle: Bundle(for: AVDebugger.self))

        self.server.add("/getAllDataFromTheTable/:pid", viewController: GetTableDataViewController.self, withNibName: String(describing: GetTableDataViewController.self), bundle: Bundle(for: AVDebugger.self))

        self.server.add("/query/:pid", viewController: QueryDBViewController.self, withNibName: String(describing: QueryDBViewController.self), bundle: Bundle(for: AVDebugger.self))
    }
}


