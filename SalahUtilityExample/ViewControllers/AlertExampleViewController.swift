//
//  AlertExampleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 9/5/22.
//  Copyright © 2022 Salah. All rights reserved.
//

import UIKit
import SalahUtility

class AlertExampleViewController: UIViewController {
   
    @IBOutlet weak var btnAlerType:UIButton!
    @IBOutlet weak var btnShow:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnAlerType(_ sender: Any) {
        
//        Alert.show(nil,Alert.attention("message", { _ in
//            print("ok")
//        }))
//        Alert.show(nil,Alert.error("message", { _ in
//            print("ok")
//        }))
//        Alert.show(nil,Alert.success("message", { _ in
//        print("ok")
//        }))
//        Alert.show(nil,Alert.fieldRequired("title","حقل الاسم", { _ in
//            print("ok")
//        }))
//        Alert.show(nil,Alert.yesOrNo("YesOr no", yes: (nil,{ _ in
//            print("YEs")
//        }), no:  (nil,{ _ in
//            print("No")
//        })))
//        Alert.show(nil,Alert.fieldRequiredTowButton("title","message", { _ in
//            print("");
//        }))
        
    }
    @IBAction func btnShow(_ sender: Any) {
        AlertBuilder.init(viewController:self, style: .alert)
        .title("title")
        .element(.text({ item in item.placeholder="asd"}))
        .element(.button("Cancel", .cancel, { _ in }))
        .element(.button("ok", .default, { _ in }))
        .execute()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
