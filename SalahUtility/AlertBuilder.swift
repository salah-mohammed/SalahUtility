//
//  AlertBuilder.swift
//  JetrxProject
//
//  Created by mac book pro on 4/4/22.
//

import Foundation
import UIKit
enum Element{
    case text(((UITextField) -> Void)?)
    case button(String,UIAlertAction.Style,((UIAlertAction) -> Void)?)
    
}
class AlertBuilder{
    private let viewController: UIViewController
    private var title:String?
    private var message :String?
    private var style : UIAlertController.Style
    var elements : [Element] = [Element]()
    @discardableResult func element(_ element : Element)->Self{
        self.elements.append(element)
        return self
    }
    @discardableResult func title(_ title: String?)-> Self{
        self.title = title
        return self
    }
    @discardableResult func message(_ message: String?)-> Self{
        self.message = message
        return self
    }
    
    init(viewController: UIViewController,style :UIAlertController.Style) {
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
    func execute(){
        let alert = self.bulid()
        viewController.present(alert, animated: true)
    }
    
}
//enum Alert{
//    case error(String,((UIAlertAction) -> Void)?)
//    case fieldRequired(String,((UIAlertAction) -> Void)?)
//    case sucess(String,((UIAlertAction) -> Void)?)
//    case attention(String,((UIAlertAction) -> Void)?)
//    case yesOrNo(String,
//                 yes:(String?,((UIAlertAction) -> Void)?),
//                 no:(String?,((UIAlertAction) -> Void)?))
//    var title: String{
//        switch self {
//        case .error(_, _),.fieldRequired(_, _):
//            return "Error".localize_
//        case .sucess(_, _):
//            return "DoneSuccessfully".localize_
//        case .attention(_, _):
//            return "Attention".localize_
//        case .yesOrNo( _, yes: _, no: _):
//            return "Attention".localize_
//        }
//    }
//static func show(_ alertType : Self){
//    if let vc = AppDelegate.delegate.navigationController?.visibleViewController{
//        let alert = AlertBuilder.init(viewController: vc, style: .alert)
//        alert.title(alertType.title)
//        switch alertType{
//        case .error(let message, let action):
//            alert.message(message).element(.button("OK".localize_, .default, action))
//            break
//        case .fieldRequired(let message, let action):
//            alert.message("FieldRequired".localize_(message)).element(.button("OK".localize_, .default, action))
//            break
//        case .sucess(let message, let action):
//            alert.message(message).element(.button("OK".localize_, .default, action))
//            break
//        case .attention(let message, let action):
//            alert.message(message).element(.button("OK".localize_, .default, action))
//            break
//        case .yesOrNo(let message, yes: let yes, no: let no):
//            alert.message(message).element(.button(yes.0 ?? "Yes".localize_, .default, yes.1)).element(.button(no.0 ?? "No".localize_, .cancel, no.1))
//            break
//        }
//        alert.execute()
//    }
//}
//}
