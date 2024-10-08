//
//  AlertBuilder.swift
//  JetrxProject
//
//  Created by mac book pro on 4/4/22.
//
#if os(iOS)
import Foundation
import UIKit
import AppTexts
public enum Element{
    case text(((UITextField,UIAlertController) -> Void)?)
    case button(String,UIAlertAction.Style,((UIAlertAction,UIAlertController) -> Void)?)
}
public class AlertBuilder{
    private let viewController: UIViewController
    private var title:String?
    private var message :String?
    private var style : UIAlertController.Style
    private var senderView:UIView?
    var elements : [Element] = [Element]()
    @discardableResult public func elements(_ elements : [Element])->Self{
        self.elements.append(contentsOf:elements)
        return self
    }
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
    @discardableResult public func senderView(_ senderView: UIView?)-> Self{
        self.senderView = senderView
        return self
    }
    public init(viewController: UIViewController,style :UIAlertController.Style) {
          self.viewController = viewController
           self.style = style
      }
    
    @discardableResult  private func build() -> UIAlertController {
        let alert = UIAlertController(title: title ?? "", message: message ?? "", preferredStyle: style)
        let senderView = self.senderView ?? self.viewController.view
        if let presenter = alert.popoverPresentationController,let senderView:UIView=senderView {
            presenter.sourceView = senderView
            presenter.sourceRect = senderView.bounds
        }
        for item in self.elements{
            switch item {
            case .text(let configurationHandler):
                alert.addTextField(configurationHandler:{ field in configurationHandler?(field,alert)})
                break
            case .button(let title, let style, let action):
                alert.addAction(UIAlertAction.init(title: title, style: style, handler:{ button in action?(button,alert)}))
                break
            }
        }
        return alert
    }
    @discardableResult public func execute()->UIAlertController{
        let alert = self.build()
        viewController.present(alert, animated: true)
        return alert
    }
    
}
//->Need array of elements

public enum AppAlert{
    // (message,okHandler)
    case error(String?,((UIAlertAction,UIAlertController) -> Void)?)
    // (title,fieldName,okHandler)
    case fieldRequired(title:String,fieldName:String,((UIAlertAction,UIAlertController) -> Void)?)
//    case normal2Actions(String,String,(String?,((UIAlertAction) -> Void)?),(String?,((UIAlertAction) -> Void)?))
    // (message,okHandler)
    case sucess(String,((UIAlertAction,UIAlertController) -> Void)?)
    // (message,okHandler)
    case attention(String?,((UIAlertAction,UIAlertController) -> Void)?)
    // (message,yesHandler,noHandler)
    case yesOrNo(String?,String,
                 yes:(String?,((UIAlertAction,UIAlertController) -> Void)?),
                 no:(String?,((UIAlertAction,UIAlertController) -> Void)?))
    // (title,message,okHandler)
    case normal(String,String,((UIAlertAction,UIAlertController) -> Void)?)
    // (title,message,elements,cancelAction)
    case elements(String,String,[Element])

    var title: String{
        switch self {
        case  .fieldRequired(let title,let message,let action):
            return title
        case .error(_, _):
            return AppTexts.Constant.error.string
        case .sucess(_, _):
            return AppTexts.Constant.alertDoneSuccessfully.string
        case .attention(_, _):
            return AppTexts.Constant.attention.string
        case .normal(let title,_, _):
            return title
        case .yesOrNo(let title, _, yes: _, no: _):
            return title ?? AppTexts.Constant.attention.string
        case .elements(let title, _, _):
            return title
        }
 }
    static public func show(_ viewController:UIViewController? = nil,_ alertType : AppAlert){
        
    if let vc = AppAlert.viewController ?? viewController{
        let alert = AlertBuilder.init(viewController: vc, style: .alert)
        alert.title(alertType.title)
        switch alertType{
        case .error(let message, let action):
            alert.message(message ?? AppTexts.Constant.anErrorOccurred.string).element(Element.button(AppTexts.Constant.ok.string, .default, action))
            break
        case .fieldRequired(_,let message, let action):
            alert.message(Validate.fieldRequired(message) ?? "").element(Element.button(AppTexts.Constant.ok.string, .default, action))
            break
        case .sucess(let message, let action):
            alert.message(message).element(Element.button(AppTexts.Constant.ok.string, .default, action))
            break
        case .attention(let message, let action):
            alert.message(message ?? AppTexts.Constant.anErrorOccurred.string).element(Element.button(AppTexts.Constant.ok.string, .default, action))
            break
        case .normal(_ ,let message, let action):
            alert.message(message).element(Element.button(AppTexts.Constant.ok.string, .default, action))
            break
        case .yesOrNo(_,let message, yes: let yes, no: let no):
            alert.message(message).element(Element.button(yes.0 ?? AppTexts.Constant.yes.string, .default, yes.1)).element(Element.button(no.0 ?? AppTexts.Constant.no.string, .cancel, no.1))
            break
        case .elements(_,let message,let elements):
            alert.message(message).elements(elements)
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
#endif
