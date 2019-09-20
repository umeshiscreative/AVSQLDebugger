//
//  String+Representable.swift
//  AVSQLDebugger
//
//  Created by Umesh
//  Copyright © 2019 Umesh. All rights reserved.
//

import Foundation

extension String {
    func extractTableNameFromQuery() -> [String] {
        if let regex = try? NSRegularExpression(pattern: "FROM\\s+(?:\\w+\\.)*(\\w+)($|\\s+[WHERE,JOIN,START\\s+WITH,ORDER\\s+BY,GROUP\\s+BY])", options: .caseInsensitive)
        {
            let string = self as NSString
            
            return regex.matches(in: self, options: [], range: NSRange(location: 0, length: string.length)).map {
                string.substring(with: $0.range).replacingOccurrences(of: "", with: "")
            }
        }
        return []
    }
    
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }

    func removeUnderScore() -> String {
        return self.replace(string: "_", replacement: "")
    }
}
