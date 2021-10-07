//
//  TestViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 11/16/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit
import SalahUtility
class TestViewController: UIViewController {
    var items:[String]=[String]();
    override func viewDidLoad() {
        super.viewDidLoad()
        items.append("1");
        items.append("2");

        if let str2:String = items.bs_get(1) {
            print(str2) // --> this still wouldn't run
        } else {
            print("No string found at that index") // --> this would be printed
        }
        // Do any additional setup after loading the view.
        
    }
    @IBAction func btnTest(_ sender:UIButton){
        self.navigationController?.navigationBar.bs_setTransparent(textAttributes: [:], tintColor: UIColor.blue)
        ;
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.navigationController?.navigationBar.defaultStyle();

        }
        //        UIImagePickerController().bs_setup()
//        self.bs_showMessageWithTitle(title: "", message:"", okHandler: nil, cancelHandler: nil, okTitle: nil, cancelTitle: nil);
        
//        repeat {
//            print("Test By Salah");
//        }while self != nil
//      var a1 = sender.bs_isSuperViewType(UITableView.self);
//      var a2 = sender.bs_isSuperViewType(UIView.self);
//        print(a1);
//        print(a2);
//
//        var b1 = sender.bs_isSuperViewExist(UIView.init());
//        var b2 = sender.bs_isSuperViewExist(self.view);
//          print(b1);
//          print(b2);
    }
}
