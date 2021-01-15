//
//  LocaleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 1/12/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class LocaleViewController: UIViewController {

    @IBOutlet weak var lblContent: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var content = "";
        content.append(NSLocale.preferredLanguages.first ?? "");
        content.append("\n");
        content.append(NSLocale.current.languageCode ?? "");
        content.append("\n");
        content.append(Locale.current.identifier);


        self.lblContent.text=content;
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
