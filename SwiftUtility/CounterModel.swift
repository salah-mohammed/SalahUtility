//
//  CounterModel.swift
//  SwiftUtility
//
//  Created by Salah on 4/25/18.
//  Copyright © 2018 Salah. All rights reserved.
//

open class CounterModel: NSObject {
    public enum InitialValue{
     case random
     case custom(Int)
    }
    public typealias CounterHandler = (Int?) -> Swift.Void
    public typealias CompletionHandler = ()->Void
    
    open var value:Int?
    open var stepValue:Int=1;
    open var initialValue:Int?;
    open var maximumValue:Int?;
    open var minimumValue:Int?;
    open var counterHandlerMax:CounterHandler?
    open var counterHandlerMin:CounterHandler?
    open var counterHandlerChangeValue:CounterHandler?
    open var counterHandlerDownValue:CounterHandler?
    open var counterHandlerUpValue:CounterHandler?
    
    open var valuekeyName:String?
    open var enableRepeat:Bool=false;
    open var initialType:InitialValue?
    var timer:Timer?;

    open var isValueGreaterThanMinAndEquals:Bool{
        if let tempMinimumValue:Int = minimumValue,let tempValue:Int = value{
            if (tempValue>=tempMinimumValue) && (tempValue-stepValue)>=tempMinimumValue{
                return true;
            }else{
                return false
            }
        }else{
            return true;
        }
    }
    open var isLessThanMaxAndEquals:Bool{
        if let tempMaximumValue:Int = maximumValue,let tempValue:Int = value{
            if (tempValue<=tempMaximumValue) && (tempValue+stepValue)<=tempMaximumValue{
                return true
            }else{
             return false
            }
        }else{
            return true;
        }
    }
    open var isValueEqualsMax:Bool{
        if let tempMaximumValue:Int = maximumValue{
            if (self.value==tempMaximumValue){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }
    public init(initialType:InitialValue?,stepValue:Int , maximumValue:Int , minimumValue:Int,counterHandlerMin:CounterHandler?,
         counterHandlerMax:CounterHandler?,
         counterHandlerChangeValue:CounterHandler?,
         counterHandlerDownValue:CounterHandler?,
         counterHandlerUpValue:CounterHandler?,_ enableRepeat:Bool=false
        ) {
        super.init();
        self.initialType=initialType;
        self.genrateInitialValue();
        self.counterHandlerChangeValue = counterHandlerChangeValue;
        self.stepValue=stepValue;
        self.maximumValue=maximumValue;
        self.minimumValue=minimumValue;
        self.counterHandlerMin = counterHandlerMin;
        self.counterHandlerMax = counterHandlerMax;
        self.value=self.initialValue;
        if let value:Int = self.value{
        self.counterHandlerChangeValue?(value)
        }
        self.counterHandlerUpValue = counterHandlerUpValue;
        self.counterHandlerDownValue = counterHandlerDownValue;
        self.enableRepeat=enableRepeat;
    }

    open func  increment(_ completionHandler:CompletionHandler? = nil )->Int?{
        if isLessThanMaxAndEquals,let tempValue:Int = self.value{
            self.value=tempValue+stepValue;
            self.counterHandlerUpValue?(value);
            self.counterHandlerChangeValue?(self.value)
            completionHandler?();
        }else
        if(value==maximumValue){
            self.counterHandlerMax?(self.value);
            if self.enableRepeat{
            self.genrateInitialValue();
            self.counterHandlerDownValue?(value);
            self.counterHandlerChangeValue?(self.value)
            }
            }
        return value;
    }
    open func  decrement(_ completionHandler:CompletionHandler? = nil )->Int? {
        if isValueGreaterThanMinAndEquals,let tempValue:Int = self.value{
            self.value=tempValue-stepValue;
            self.counterHandlerDownValue?(value);
            self.counterHandlerChangeValue?(self.value)
            completionHandler?();
        }else if(value==minimumValue){
        self.counterHandlerMin?(self.value);
        }
        return value;
    }
    open func  reSet(){
        self.value=initialValue;
    }
    
    func genrateInitialValue(){
        var tempInitialValue:Int?
        switch initialType{
        case .random:
            if let minimumValue:Int,let maximumValue:Int {
            tempInitialValue=Int.init(random:minimumValue...maximumValue);
            }else{
            tempInitialValue = 0
            }
            break;
        case .custom(let initialValue):
            tempInitialValue = initialValue
            break;
        case .none:
            break
        }
        self.initialValue=tempInitialValue;
        self.value=initialValue;
    }
    open func autoIncrement(every timeInterval:TimeInterval){
        self.invalidate();
        self.timer = Timer.scheduledTimer(withTimeInterval:timeInterval, repeats: true) { (timer) in
            self.increment();
        }
    }
    open func invalidate(){
        self.timer?.invalidate();
        self.timer=nil;
    }
}
