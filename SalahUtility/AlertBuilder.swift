//
//  AlertBuilder.swift
//  JetrxProject
//
//  Created by mac book pro on 4/4/22.
//

import Foundation
import UIKit
public enum Element{
    case text(((UITextField) -> Void)?)
    case button(String,UIAlertAction.Style,((UIAlertAction) -> Void)?)
    
}
public class AlertBuilder{
    private let viewController: UIViewController
    private var title:String?
    private var message :String?
    private var style : UIAlertController.Style
    var elements : [Element] = [Element]()
    @discardableResult public func element(_ element : Element)->Self{
        self.elements.append(element)
        return self
    }
    @discardableResult public func title(_ title: String?)-> Self{
        self.title = title
        return self
    }
    @discardableResult public func message(_ message: String?)-> Self{
        self.message = message
        return self
    }
    
    public init(viewController: UIViewController,style :UIAlertController.Style) {
          self.viewController = viewController
           self.style = style
      }
    
    @discardableResult  public func bulid() -> UIAlertController {
        let alert = UIAlertController(title: title ?? "", message: message ?? "", preferredStyle: style)
        for item in self.elements{
            switch item {
            case .text(let configurationHandler):
                alert.addTextField(configurationHandler: configurationHandler)
                break
            case .button(let title, let style, let action):
                alert.addAction(UIAlertAction.init(title: title, style: style, handler: action))
                break
            }
        }
        return alert
    }
    public func execute(){
        let alert = self.bulid()
        viewController.present(alert, animated: true)
    }
    
}
public enum Alert{
    case error(String,((UIAlertAction) -> Void)?)
    case fieldRequired(String,String,((UIAlertAction) -> Void)?)
    case fieldRequiredTowButton(String,String,((UIAlertAction) -> Void)?)
    case sucess(String,((UIAlertAction) -> Void)?)
    case attention(String,((UIAlertAction) -> Void)?)
    case yesOrNo(String,
                 yes:(String?,((UIAlertAction) -> Void)?),
                 no:(String?,((UIAlertAction) -> Void)?))
    var title: String{
        switch self {
        case .fieldRequiredTowButton(let title , let message , let action):
            return title
        case  .fieldRequired(let title,let message,let action):
            return title
        case .error(_, _):
            return Localize.Error
        case .sucess(_, _):
            return Localize.DoneSuccessfully
        case .attention(_, _):
            return Localize.Attention
        case .yesOrNo( _, yes: _, no: _):
            return Localize.Attention
        }
 }
    static public func show(_ viewController:UIViewController? = nil,_ alertType : Alert){
    if let vc = Alert.viewController ?? viewController{
        let alert = AlertBuilder.init(viewController: vc, style: .alert)
        alert.title(alertType.title)
        switch alertType{
        case .error(let message, let action):
            alert.message(message).element(Element.button(Localize.Ok, .default, action))
            break
        case .fieldRequired(let title,let message, let action):
            alert.message(Localize.FieldRequired(message)).element(Element.button(Localize.Ok, .default, action))
            break
        case .fieldRequiredTowButton(let title,let message, let action):
            alert.message(Localize.FieldRequired(message)).element(Element.button(Localize.Ok, .default, action)).element(Element.button(Localize.Cancel, .default,nil))
            break
        case .sucess(let message, let action):
            alert.message(message).element(Element.button(Localize.Ok, .default, action))
            break
        case .attention(let message, let action):
            alert.message(message).element(Element.button(Localize.Ok, .default, action))
            break
        case .yesOrNo(let message, yes: let yes, no: let no):
            alert.message(message).element(Element.button(yes.0 ?? "Yes".localize_, .default, yes.1)).element(Element.button(no.0 ?? "No".localize_, .cancel, no.1))
            break
        }
        alert.execute()
    }
}
     static var viewController:UIViewController?{
        let rootViewController = UIApplication.shared.bs_window?.rootViewController
        if let rootViewController:UINavigationController = rootViewController as? UINavigationController{
            return rootViewController.visibleViewController
        }
        return rootViewController;
    }
}


