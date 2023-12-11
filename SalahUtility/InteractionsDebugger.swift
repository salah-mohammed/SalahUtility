//
//  InteractionsDebugger.swift
//  SalahUtility
//
//  Created by SalahMohamed on 24/08/2023.
//  Copyright © 2023 Salah. All rights reserved.
//


public class InteractionsDebugger{
    private var appKey:String
    public init(_ appKey:String="InteractionsDebugger"){
        self.appKey = appKey
    }
    
    public func debug(_ featureName:String){
        var count = interactions(featureName:featureName)
        count = (count + 1)
        save(count:count,featureName:featureName)
    }
    public func interactions(featureName:String)->Int{
        return UserDefaults.standard.integer(forKey:key(featureName));
    }
    private func save(count:Int,featureName:String){
        UserDefaults.standard.set(count, forKey:key(featureName))
        UserDefaults.standard.synchronize();
    }
    private func key(_ featureName:String)->String{
     return "\(self.appKey).\(featureName)"
    }
}
