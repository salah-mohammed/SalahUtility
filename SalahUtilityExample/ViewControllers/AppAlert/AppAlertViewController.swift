//
//  AppAlertViewController.swift
//  netStream
//
//  Created by Salah on 3/23/21.
//

import Foundation
import UIKit

class AppAlertViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMessage:UILabel!
    @IBOutlet weak var stackView:UIStackView!
//    var actions:[UIButton]=[UIButton]();
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView();
        localized();
        setupData();
        fetchData();
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
        self.view.backgroundColor=UIColor.black.withAlphaComponent(0.3);
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.view.backgroundColor=UIColor.clear

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
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
extension AppAlertViewController{
    func setupView(){
        self.view.backgroundColor=UIColor.clear
    }
    func localized(){
        
    }
    func setupData(){
        
    }
    func fetchData(){
        
    }
}
extension AppAlertViewController{
    
}
