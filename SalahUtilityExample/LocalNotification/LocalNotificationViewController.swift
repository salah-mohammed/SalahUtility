//
//  LocalNotificationViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 11/16/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit
import SalahUtility
class LocalNotificationViewController: UIViewController {

    @IBOutlet weak var btnTest: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnTest.setTitle("Test".bs_localized("ar"), for: .normal);
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnTest(_ sender: Any) {
//        NotificationBuilder.init().title("Test".bs_localized("ar")+"5").subTitle("Test".bs_localized("ar")+"5").body("Test".bs_localized("ar")+"5").trigger(NotificationBuilder.Trigger.timeInterval(value: 3)).identifier("ad").repeats(false).sound(UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "localNotificationAudio.m4a"))).build().execute();
        NotificationBuilder.init().title("غدا هو ").subTitle("Test".bs_localized("ar")+"5").body("Test".bs_localized("ar")+"5").trigger(NotificationBuilder.Trigger.timeInterval(value: 3)).identifier("ad").repeats(false).sound(UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "localNotificationAudio.m4a"))).build().execute();

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
