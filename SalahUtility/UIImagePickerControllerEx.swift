//
//  UIImagePickerControllerEx.swift
//  SalahUtility
//
//  Created by Salah on 3/22/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import Foundation
import UIKit
extension UIImagePickerController:UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    public typealias bs_FinishHandler = ([UIImagePickerController.InfoKey : Any]) -> Void
    public typealias bs_CancelHandler = () -> Void

     struct PrivateProperties {
        static var FinishHandler = "bs_FinishHandler"
        static var CancelHandler = "bs_CancelHandler"
    }
     public var bs_finishHandlerAction:bs_FinishHandler?
    {
        set
        {
            objc_setAssociatedObject(
                self,
                &PrivateProperties.FinishHandler,
                newValue as bs_FinishHandler?,
                objc_AssociationPolicy(rawValue: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC.rawValue)!)

        }
        get{
            let  tempObject:bs_FinishHandler = objc_getAssociatedObject(self, &PrivateProperties.FinishHandler) as! bs_FinishHandler


            return tempObject;
        }
    }
    var bs_cancelHandler:bs_CancelHandler?
   {
       set
       {
           objc_setAssociatedObject(
               self,
               &PrivateProperties.CancelHandler,
               newValue as bs_CancelHandler?,
               objc_AssociationPolicy(rawValue: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC.rawValue)!)

       }
       get{
           let  tempObject:bs_CancelHandler = objc_getAssociatedObject(self, &PrivateProperties.CancelHandler) as! bs_CancelHandler


           return tempObject;
       }
   }
    @discardableResult public func bs_setup() -> UIImagePickerController {
        self.delegate = self;
        self.modalPresentationStyle = .formSheet
        return self;
    }
    public func bs_present(_ presenter:UIViewController)->Self{
        presenter.present(self, animated: true, completion: nil);
        return self;
    }
    @discardableResult public func bs_setFinishHandler(_ bs_finishHandler:@escaping UIImagePickerController.bs_FinishHandler)->Self {
        self.bs_finishHandlerAction = bs_finishHandler;
        return self;
    }
    @discardableResult public func bs_setCancelHandler(_ bs_cancelHandler:@escaping UIImagePickerController.bs_CancelHandler)->Self {
        self.bs_cancelHandler = bs_cancelHandler;
        return self;
    }
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.bs_cancelHandler?();
    }
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        bs_finishHandlerAction?(info)
    }
}
