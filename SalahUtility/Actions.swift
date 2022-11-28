//
//  Actions.swift
//  SalahUtility
//
//  Created by SalahMohamed on 28/11/2022.
//  Copyright © 2022 Salah. All rights reserved.
//
#if os(iOS)

import Foundation
import UIKit

final public class Action: BaseAction {
    var control:UIControl?
    private let _action: (UIControl) -> ()
    public init(_ action: @escaping (UIControl) -> ()) {
        _action = action
        super.init()
    }
    @objc func action() {
        _action(control!)
    }
    deinit {
        print("deinit")
    }
}
public extension UIControl{
    func bs_action(_ controlEvents: UIControl.Event, _ action:Action) {
        action.control=self;
        self.addTarget(action, action:#selector(action.action), for:controlEvents)
}
}
public class BaseAction: NSObject {
    
}
final public class GestureAction: BaseAction {
    var senderView:UIView?
    var gesture:UIGestureRecognizer?
    private let _action: (UIView?,UIGestureRecognizer?) -> Void
    public init(_ action: @escaping (UIView?,UIGestureRecognizer?) -> Void) {
        _action = action
        super.init()
    }
    @objc func action() {
        _action(senderView,gesture)
    }
    deinit {
        print("deinit")
    }
}
public extension UIView{
    func bs_tap(_ action:GestureAction) {
        action.senderView=self;
        let tapGesture = UITapGestureRecognizer.init(target:action, action:#selector(action.action))
        action.gesture=tapGesture
        self.addGestureRecognizer(tapGesture);
    }
    func bs_longPress(_ config:((UILongPressGestureRecognizer)->Void)? = nil,_ action:GestureAction){
        action.senderView=self;
        let longPressGestureRecognizer = UILongPressGestureRecognizer.init(target: action, action:#selector(action.action))
        action.gesture=longPressGestureRecognizer
        self.addGestureRecognizer(longPressGestureRecognizer)
        config?(longPressGestureRecognizer);
    }
}
#endif



