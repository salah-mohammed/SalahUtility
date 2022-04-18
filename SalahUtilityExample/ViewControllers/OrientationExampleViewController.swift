//
//  OrientationExampleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 4/18/22.
//  Copyright © 2022 Salah. All rights reserved.
//

import UIKit

class OrientationExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator);
        
        print("isFlat: \(UIDevice.current.orientation.isFlat)")
        print("isPortrait: \(UIDevice.current.orientation.isPortrait)")
        print("isLandscape: \(UIDevice.current.orientation.isLandscape)")
        print("\n\\\\\\\\\\n")

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
