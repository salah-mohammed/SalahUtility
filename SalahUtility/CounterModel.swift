//
//  CounterModel.swift
//  IOSTemplateExample
//
//  Created by Salah on 4/25/18.
//  Copyright © 2018 Salah. All rights reserved.
//

import UIKit

open class CounterModel: NSObject {
    public typealias CounterHandler = (Int) -> Swift.Void
    public typealias CompletionHandler = ()->Void
    
    open var value:Int!
    open var stepValue:Int!;
    open var initialValue:Int?;
    open var maximumValue:Int!;
    open var minimumValue:Int!;
    open var counterHandlerMax:CounterHandler?
    open var counterHandlerMin:CounterHandler?
    open var counterHandlerChangeValue:CounterHandler?
    open var counterHandlerDownValue:CounterHandler?
    open var counterHandlerUpValue:CounterHandler?
    
    open var valuekeyName:String!
    open var isValueEqualsMin:Bool{
        if (self.value==self.minimumValue){
            return true;}
        return false;
    }
    open var isValueGreaterThanMaxAndEquals:Bool{
        if (self.value>=self.maximumValue){
            return true;}
        return false;
    }
    open var isLessThanMaxAndEquals:Bool{
        if (self.value<=self.maximumValue){
            return true;}
        return false;
    }
    open var isValueLessThanMax:Bool{
        if (self.value<self.maximumValue){
            return true;}
        return false;
    }
    open var isValueGreaterThanMax:Bool{
        if (self.value>self.maximumValue){
            return true;}
        return false;
    }
    open var isValueEqualsMax:Bool{
        if (self.value==self.maximumValue){
            return true;}
        return false;
    }
    public init(initialValue:Int?,stepValue:Int , maximumValue:Int , minimumValue:Int,counterHandlerMin:CounterHandler?,
         counterHandlerMax:CounterHandler?,
         counterHandlerChangeValue:CounterHandler?,
         counterHandlerDownValue:CounterHandler?,
         counterHandlerUpValue:CounterHandler?
        ) {
        super.init();
        self.counterHandlerChangeValue = counterHandlerChangeValue;
        self.initialValue=initialValue;
        self.stepValue=stepValue;
        self.maximumValue=maximumValue;
        self.minimumValue=minimumValue;
        self.counterHandlerMin = counterHandlerMin;
        self.counterHandlerMax = counterHandlerMax;
        self.value=initialValue;
        if self.counterHandlerChangeValue != nil {
            self.counterHandlerChangeValue!(self.value)
        }
        self.counterHandlerUpValue = counterHandlerUpValue;
        self.counterHandlerDownValue = counterHandlerDownValue;
        
    }
    open func  increment(_ completionHandler:CompletionHandler? = nil )->Int{
        if (value<=maximumValue&&(value+stepValue)<=maximumValue) {
            value=value+stepValue;
            if self.counterHandlerUpValue != nil {
                self.counterHandlerUpValue!(value);
            }
            if self.counterHandlerChangeValue != nil {
                self.counterHandlerChangeValue!(self.value)
            }
            if completionHandler != nil {
                completionHandler!();
            }
            if(value==maximumValue)
            {
                if self.counterHandlerMax != nil{
                    self.counterHandlerMax!(self.value);
                }
            }
        }
        return value;
    }
    open func  decrement(_ completionHandler:CompletionHandler? = nil )->Int {
        if (value>=minimumValue&&(value-stepValue)>=minimumValue) {
            value=value-stepValue;
            if self.counterHandlerDownValue != nil {
                self.counterHandlerDownValue!(value);
            }
            if self.counterHandlerChangeValue != nil {
                self.counterHandlerChangeValue!(self.value)
            }
            if completionHandler != nil {
                completionHandler!();
            }
            if(value==minimumValue)
            {
                if self.counterHandlerMin != nil{
                    self.counterHandlerMin!(self.value);
                }
                
            }
        }
        return value;
    }
    open func  reSet()
    {
        self.value=initialValue;
    }
    
    
}
