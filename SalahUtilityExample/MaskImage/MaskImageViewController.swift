//
//  MaskImageViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 10/30/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class MaskImageViewController: UIViewController {
    @IBOutlet var image:UIView!
    @IBOutlet var maskView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        image.mask = maskView
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);

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
