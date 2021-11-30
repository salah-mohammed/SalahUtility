//
//  DaynamicScrollViewViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 2/1/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

//1. throw scrollview  in view in viewcontroller.
//2. connect constraints of scrollview to parent by safe Area.
//3. remove checkbox from Content Layout Guides Box.
//4. set stackView inside ScrollView.
//5. connect constraint of stackview to scrollview by super not safe area from top = 0,bottom = 0,leading = 0,trailing = 0
//6.set constraint height for stackview (200 or less than anyscreen) and make priority 999 for this constraint.
//7.set constraint equal height from stackView to scrollview and make it > 0.
class DaynamicScrollViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
