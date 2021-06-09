//
//  NavigationHeightExampleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 2/4/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit
import SalahUtility
class NavigationHeightExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows.first
            let topPadding = window?.safeAreaInsets.top
            let bottomPadding = window?.safeAreaInsets.bottom
            print(topPadding)
            print("\n")
            print(bottomPadding)
            let hasTopNotch = bs_hasTopNotch
            print(bs_hasTopNotch);
        }
        
        // Do any additional setup after loading the view.
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
