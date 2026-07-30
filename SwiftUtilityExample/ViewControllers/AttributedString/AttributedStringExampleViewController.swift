//
//  AttributedStringExampleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 8/30/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit


class AttributedStringExampleViewController: UIViewController {
    @IBOutlet weak var lblContent:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let initialString = "This is the initial string initial"
        let attributes = [NSAttributedString.Key.foregroundColor : UIColor.red]
        let mutableAttributedString = NSMutableAttributedString(string: initialString, attributes: attributes)
             
        self.lblContent.attributedText = mutableAttributedString.bs_target("initial",  [NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue])
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
