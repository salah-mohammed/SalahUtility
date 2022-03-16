//
//  LettersDrawViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 3/9/22.
//  Copyright © 2022 Salah. All rights reserved.
//

import UIKit
class LetterRect:UIView{
   typealias finish = ()->Void
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event);
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event);
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event);
        if let touch = touches.first {
           let position = touch.location(in: self)
            if position.equalTo(CGPoint.init(x: self.frame.width, y: self.frame.height)){
                print("finish");
            }
        }
    }
}
class LettersDrawViewController: UIViewController {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.bs_rotate(degrees: 20)
        secondView.bs_rotate(degrees: -20);

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
