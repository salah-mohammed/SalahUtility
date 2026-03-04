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
    @IBOutlet weak var btnReplaceMatching: UIButton!
    @IBOutlet weak var btnIsMatches: UIButton!

    @IBOutlet weak var lblReplaceMatching: UILabel!
    @IBOutlet weak var lblIsMatches: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    //
    
    // MARK: - Is Matches
    @IBAction func btnIsMatches(_ sender: Any) {
        var text = ""
        var  isMatches_1 = RegularExpression.email.regex.matches(input:"asdasd@hotmail.com")
        if isMatches_1 {
            text.append("isMatches_1: successful")
        }else{
            text.append("isMatches_1: fail")
        }
    let regularExpressionForNumbersOnly = "^[0-9]"

    let isMatches_2 = Regex.init(regularExpressionForNumbersOnly).matches(input:"salaha");
        if isMatches_2 {
            text.append(", isMatches_2: successful")
        }else{
            text.append(", isMatches_2: fail")
        }
        let isMatches_3 = Regex.init(regularExpressionForNumbersOnly).matches(input:"1234");
            if isMatches_3 {
                text.append(", isMatches_3: successful")
            }else{
                text.append(", isMatches_3: fail")
            }
        
        self.lblIsMatches.text = text
    }
    
    
    // MARK: - Replace Matching
    @IBAction func btnReplaceMatching(_ sender: Any) {
        var text1 = test1_replaceMatchingEmailWithCharacters();
        print(text1);
        self.lblReplaceMatching.text=text1;
        var text2 = test2_replaceMatchingPhoneWithCharacters();
        print(text2);
        self.lblReplaceMatching.text=text2;
        var text3 = test3_replaceMatchingPhoneWithCharacters();
        print(text3);
        var text4 = test4_replaceMatchingEmailWithCharacters();
        print(text4);
        self.lblReplaceMatching.text=text4;
        
    }
    
    func test1_replaceMatchingEmailWithCharacters()->String{
        var  text = RegularExpression.email.regex.replacement(input:"dsadsadasdsdasdsadsadsadsadsad  salah@hotmail.com sal@ail.com", replacement:"x")
        return text;
    }
    func test2_replaceMatchingPhoneWithCharacters()->String{
        var  text = RegularExpression.phone.regex.replacement(input:"dsadsadasdsdasdsadsadsadsadsad 12 22222222222323232323232323232 111111111 00972 +972597", replacement:"xxxxxxxxx")
         return text
    }
    func test3_replaceMatchingPhoneWithCharacters()->String{
        var  text = RegularExpression.phone.regex.replacement(input:"dsadsadasdsdasdsadsadsadsadsad 12 22222222222323232323232323232 111111111 00972 +972597", replacement:"xxxxxxxxx")
         return text
    }
    func test4_replaceMatchingEmailWithCharacters()->String{
        var  text = Regex(RegularExpression.email.rawValue).replacement(input:"dsadsadasdsdasdsadsadsadsadsad  salah@hotmail.com sal@ail.com", replacement:"x")
        return text;
    }
}


