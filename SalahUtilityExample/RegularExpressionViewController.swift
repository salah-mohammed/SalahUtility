//
//  RegularExpressionViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 1/26/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class RegularExpressionViewController: UIViewController {
    @IBOutlet weak var btnTest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnTest(_ sender: Any) {
        // for email
        if Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").test(input: "salah@sdad.com") {
          print("succefull")
        }else{
            print("");
        }
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

class Regex {
  let internalExpression: NSRegularExpression
  let pattern: String

  init(_ pattern: String) {
//    print(pattern);
    self.pattern = pattern
    var error: NSError?
    self.internalExpression = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    
  }

  func test(input: String) -> Bool {
    let matches = self.internalExpression.matches(in:input, range:NSMakeRange(0,input.count))
    return matches.count > 0
  }
}
