//
//  AppAlertViewController.swift
//  netStream
//
//  Created by Salah on 3/23/21.
//

import Foundation
import UIKit
import SwiftUtility
class AppAlertViewController: BaseAlertViewController {
    open override var defaultAlphaValue:CGFloat{
     return 0.65
    }
    open override var defaultColorValue:UIColor{
     return UIColor.black
    }
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage:UILabel!
    @IBOutlet weak var stackView:UIStackView!
//    var actions:[UIButton]=[UIButton]();
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        self.addAction("21321", UIColor.black) {
            
        }
        self.addAction("21321", UIColor.black) {
            
        }
//        vc.addAction("12313", UIColor.red) {
//
//        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    @IBAction func btnDismis(_ sender: Any) {
        self.dismiss(animated: true);
    }
    func addAction(_ title:String,_ titleColor:UIColor,action:()->Void){
        var action =  UIButton.init();
        action.setTitle(title, for: .normal);
        action.setTitleColor(titleColor, for: .normal);
        if self.stackView.subviews.count <= 2{
            self.stackView.spacing=500;
            stackView.axis = .horizontal
        }else{
            self.stackView.spacing=8;
            stackView.axis = .vertical
        }
        stackView.addArrangedSubview(action)

    }
    
}
