//
//  DateBuilder.swift
//  SalahUtility
//
//  Created by SalahMohamed on 15/05/2025.
//  Copyright © 2025 Salah. All rights reserved.
//


public typealias DateFormatType = String

public protocol DateRequest{
    var calendar:Calendar{get}
    var dateFormate:String{get set}
    var local:Locale?{get}
    var timeZone:TimeZone?{get}
    init( dateFormate: String)
}
public class DateBuilder{
    var dateFormatter:DateFormatter?
    var dateRequest:DateRequest?
    var date:Date?
    public init() {
        
    }
    public func date(date:Date)->Self{
        self.date=date
        return self
    }
    public func dateReuest(dateRequest:DateRequest)->Self{
        self.dateRequest=dateRequest
        return self
    }
    public func build()->Self{
        if let dateReuest:DateRequest = dateRequest{
            self.dateFormatter = self.construct(request:dateReuest)
        }
      return self
    }
    public func execute()->String?{
        if let date:Date = self.date{
            return self.dateFormatter?.string(from:date)
        }else{return nil}
    }
    fileprivate func construct(request:DateRequest)->DateFormatter{
     let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = request.dateFormate;
        dateFormatter.calendar = request.calendar
        dateFormatter.locale = request.local ?? Locale.current
        dateFormatter.timeZone = request.timeZone
     return dateFormatter
    }
}
