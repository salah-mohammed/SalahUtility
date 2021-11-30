//
//  ObserverExampleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 11/30/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class ObserverExampleViewController: UIViewController {
    @objc dynamic var item:String?
    var observation: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        observation = observe(
             \.item,
             options: [.old, .new]
         ) { object, change in
             print("TabBar isHidden changed from : \(change.oldValue!), updated to: \(change.newValue!)")
         }
        
        item = "ds";
        item = "ds2";

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
