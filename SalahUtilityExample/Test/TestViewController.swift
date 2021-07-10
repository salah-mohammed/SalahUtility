//
//  TestViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 11/16/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit

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
//        UIImagePickerController().bs_setup()
        self.bs_showMessageWithTitle(title: "", message:"", okHandler: nil, cancelHandler: nil, okTitle: nil, cancelTitle: nil);
    }
}
