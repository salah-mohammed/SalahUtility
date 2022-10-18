//
//  Validate.swift
//  SalahUtility
//
//  Created by SalahMohamed on 18/10/2022.
//  Copyright © 2022 Salah. All rights reserved.
//

import UIKit

class Validate: NSObject {
    public class func fieldRequired(_ value:String)->String?{
      return  String.init(format: "FieldRequired".internalLocalize_, arguments:[value])
    }
    public class func fieldNotValid(_ value:String)->String?{
      return  String.init(format: "NotValid".internalLocalize_, arguments:[value])
    }
    func newPassword(_ newPassword:String?)->String?{
        if newPassword?.isEmpty ?? true{
            return Validate.fieldRequired(Localize.NewPassword);
        }else
        if (newPassword?.count ?? 0) < 6 {
            return Localize.PasswordMustHave6
        }
        return nil
    }
    public class func confirmPaswword(_ password:String?,_ confirmPassword:String?)->String?{
        if password?.isEmpty ?? true{
            return Validate.fieldRequired(Localize.ConfirmPassword);
        }else
        if confirmPassword != password {
            return Localize.PasswordNotMatch
        }
        return nil
    }
    public class func email(_ email:String?)->String?{
       if  RegularExpression.email.regex.matches(input:email ?? "")==false {
           return Validate.fieldNotValid(Localize.Email)
       }
        return nil
    }
}
