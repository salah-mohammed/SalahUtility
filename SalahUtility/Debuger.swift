//
//  Debuger.swift
//  SalahUtility
//
//  Created by Salah on 3/8/21.
//  Copyright © 2021 Salah. All rights reserved.
//

public class Debuger{
    public static let shared: Debuger = { Debuger()} ()
    
    public var items:[String]=[String]();
    public func debugLog(object: Any, functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
      #if DEBUG
        let className = (fileName as NSString).lastPathComponent
      var string = "<\(className)> \(functionName) [#\(lineNumber)]| \(object)\n";
      self.items.append(string);
      print(string)
      #endif
        
    }
    public func printItems()->String{
        let message = self.items.joined(separator:"       ->>>>>       ");
        self.items.append(message);
        return message;
    }
}
