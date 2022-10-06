//
//  ContainerExampleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 9/26/22.
//  Copyright © 2022 Salah. All rights reserved.
//

import UIKit
class TempRootNavigationController:UINavigationController{
    override func awakeFromNib() {
        super.awakeFromNib();


     }
    override func viewDidLoad() {
        super.viewDidLoad();

       
        
    }
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
       }

}
class ContainerExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        // Do any additional setup after loading the view.
    }
    override func awakeFromNib() {
        super.awakeFromNib();
        
//        self.view.superview?.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
//                                                      options: [],
//                                                      metrics: nil,
//                                                                           views: ["childView": self.view.superview]))
//        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
//                                                      options: [],
//                                                      metrics: nil,
//                                                                           views: ["childView": self.view.superview]))
    }
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
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
