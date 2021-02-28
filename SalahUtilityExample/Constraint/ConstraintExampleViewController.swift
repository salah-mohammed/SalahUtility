//
//  ConstraintExampleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 2/28/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class ConstraintExampleViewController: UIViewController {

    @IBOutlet weak var btnAdd: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var newView = UIView.init();
        newView.backgroundColor=UIColor.red;
        var customeSuperView=self.view as! UIView
        self.view.addSubview(newView);
        newView.translatesAutoresizingMaskIntoConstraints = false

        customeSuperView.addConstraint(NSLayoutConstraint(item: newView, attribute: .trailing, relatedBy: .equal, toItem: customeSuperView, attribute: .trailing, multiplier: 1, constant:10))
        customeSuperView.addConstraint(NSLayoutConstraint(item: newView, attribute: .leading, relatedBy: .equal, toItem: customeSuperView, attribute: .leading, multiplier: 1, constant:10))
        customeSuperView.addConstraint(NSLayoutConstraint(item: newView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1, constant:10))
        customeSuperView.addConstraint(NSLayoutConstraint(item: newView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 131))
    }
    
    @IBAction func btnAdd(_ sender: Any) {

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
