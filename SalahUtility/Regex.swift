//
//  Regex.swift
//  SalahUtility
//
//  Created by Salah on 1/26/21.
//  Copyright © 2021 Salah. All rights reserved.
//

open class Regex {
  private var internalExpression: NSRegularExpression?
  private var pattern: String?

    public init(_ pattern: String) {
    self.pattern = pattern
    do {
        self.internalExpression = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    } catch _ {
    
    }
    
  }
    open func matches(input: String) -> Bool {
    let matches = self.internalExpression?.matches(in:input, range:NSMakeRange(0,input.count))
    return (matches?.count ?? 0) > 0
  }
    
    open func replacement(input:String,replacement:String) -> String {
    var output=input;
        output=internalExpression?.stringByReplacingMatches(in: output, options:.reportProgress, range:NSMakeRange(0,input.count), withTemplate: replacement) ?? "";
        return output;
    }
    open func getMatches(input: String) -> [String] {
        guard let regex = self.internalExpression else { return [] }
        let matches = regex.matches(in: input, range: NSMakeRange(0, input.count))
        return matches.map { match in
            if let range = Range(match.range, in: input) {
                return String(input[range])
            }
            return ""
        }.filter { !$0.isEmpty }
    }
    
    open func getFirstMatch(input: String) -> String? {
        guard let regex = self.internalExpression else { return nil }
        guard let match = regex.firstMatch(in: input, range: NSMakeRange(0, input.count)) else { return nil }
        if let range = Range(match.range, in: input) {
            return String(input[range])
        }
        return nil
    }
}
