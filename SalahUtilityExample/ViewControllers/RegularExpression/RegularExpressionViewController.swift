//
//  RegularExpressionViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 1/26/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit
import SalahUtility
class RegularExpressionViewController: UIViewController {


    // explain '|' OR
    // explain '[0-9]{9,}' OR 9 or more digits
    // explain '[+]' string has prefix +
    // explain '[00]+[0-9]{1,}' any number start with prefx 00 and contains one or more digits
    // explain ']+['  + here used for build block
    // [0-9 ] // white space for ignor white speace between numbers
    @IBOutlet weak var btnTest: UIButton!
    
    @IBOutlet weak var lblCotnent: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnTest(_ sender: Any) {
        // for email
//        if Regex(emailRegix).test(input: "salah@sdad.com") {
//          print("succefull")
//        }else{
//            print("");
//        }
        
        var  a = RegularExpression.email.regex.replacement(input:"dsadsadasdsdasdsadsadsadsadsad  salah@hotmail.com sal@ail.com", replacement:"x")
        print(a);
        self.lblCotnent.text=a;
        
        var  a2 = RegularExpression.phone.regex.replacement(input:"dsadsadasdsdasdsadsadsadsadsad 12 22222222222323232323232323232 111111111 00972 +972597", replacement:"xxxxxxxxx")
         print(a2);
         self.lblCotnent.text=a2;
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


