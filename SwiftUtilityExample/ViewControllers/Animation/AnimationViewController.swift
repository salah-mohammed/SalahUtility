//
//  AnimationViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 10/30/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        


    }
    @IBAction func btnTest(_ sender:UIButton){
        self.btn.bs_zoom();
//        self.imageView.animation();
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
extension UIView {
  func animateBorderWidth(toValue: CGFloat, duration: Double) {
    let animation:CABasicAnimation = CABasicAnimation(keyPath: "borderWidth")
    animation.fromValue = layer.borderWidth
    animation.toValue = toValue
    animation.duration = duration
    layer.add(animation, forKey: "Width")
    layer.borderWidth = toValue
  }
    func animation(borderWidth:CGFloat=1,corner:CGFloat=5){
        let storkeLayer = CAShapeLayer()
        storkeLayer.fillColor = UIColor.clear.cgColor
        storkeLayer.strokeColor = UIColor.red.cgColor
        storkeLayer.lineWidth = 2

        // Create a rounded rect path using button's bounds.
        storkeLayer.path = CGPath.init(roundedRect: self.bounds, cornerWidth:corner, cornerHeight:corner, transform: nil) // same path like the empty one ...
        // Add layer to the button
        self.layer.addSublayer(storkeLayer)

        // Create animation layer and add it to the stroke layer.
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = CGFloat(0.0)
        animation.toValue = CGFloat(1.0)
        animation.duration = 1
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        storkeLayer.add(animation, forKey: "circleAnimation")
    }
}
////
