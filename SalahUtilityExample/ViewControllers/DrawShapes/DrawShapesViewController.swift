//
//  DrawShapesViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 3/1/22.
//  Copyright © 2022 Salah. All rights reserved.
//

import UIKit

class DrawShapesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

class CutomeShape:UIView{
    let cutomeShape = CAShapeLayer()
    let cutomePath = UIBezierPath()

    override func draw(_ rect: CGRect) {
        super.draw(rect);
//        // this for build cutome shape
        cutomePath.move(to: CGPoint.zero)
        cutomePath.addLine(to: CGPoint(x: 50, y: 50))
        cutomePath.addLine(to: CGPoint(x: 50, y: 150))
        cutomePath.addLine(to: CGPoint(x: 150, y: 50))
        cutomePath.addLine(to: CGPoint.zero)

//        // this for build squire
//        cutomePath.move(to: CGPoint.zero)
//        cutomePath.addLine(to: CGPoint(x: 50, y:0))
//        cutomePath.addLine(to: CGPoint(x: 50, y: 50))
//        cutomePath.addLine(to: CGPoint(x:0, y: 50))
//        cutomePath.addLine(to: CGPoint.zero)
        
        cutomeShape.path = cutomePath.cgPath
        self.layer.mask = cutomeShape;
        // Fill
        UIColor.green.setFill()
        cutomePath.fill()
        
        // Stroke
        UIColor.red.setStroke()
        cutomePath.lineWidth = 1
        cutomePath.stroke()
        
    }
}
