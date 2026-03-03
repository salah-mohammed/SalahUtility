//
//  BaseAlertViewController.swift
//  SalahUtility
//
//  Created by SalahMohamed on 21/10/2022.
//  Copyright © 2022 Salah. All rights reserved.
//
#if os(iOS)
import Foundation
import UIKit
open class BaseAlertViewController:UIViewController{
    open var defaultAlphaValue:CGFloat{
     return 0.65
    }
    open var defaultColorValue:UIColor{
     return UIColor.black
    }
    open override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor=UIColor.clear
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        setupAlert();
    }
    func setupAlert(){
        if #available(iOS 13.0, *) {
            self.isModalInPresentation=false
        }
        self.modalPresentationStyle = .overFullScreen
    }
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor=defaultColorValue.withAlphaComponent(defaultAlphaValue)
    }
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.view.backgroundColor=UIColor.clear
    }
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        self.modalPresentationStyle = .overFullScreen
    }
    required public init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
}
#endif
