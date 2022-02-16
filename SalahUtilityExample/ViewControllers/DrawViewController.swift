//
//  DrawViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 2/15/22.
//  Copyright © 2022 Salah. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {
    @IBOutlet weak var viewAA: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAA.drawText();
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
class CustomView: UIView {
    var title: String="aaaa"
    
    init(title: String) {
        self.title = title
        super.init(frame: CGRect.zero)
        config()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    //    fatalError("init(coder:) has not been implemented")
    }
    
    private func config() {
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) { // do not call super
//        self.config()
        UIColor.red.setFill()
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: 10)
        path.fill()
        weak var context = UIGraphicsGetCurrentContext() // Apple wants this to be weak
        context?.saveGState()
        context?.setBlendMode(CGBlendMode.destinationOut)
        title.draw(at: CGPoint.zero, withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24)])
        context?.restoreGState()
    }
}

extension UIView{
    func drawText(){
        UIColor.red.setFill()
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: 10)
        path.fill()
        weak var context = UIGraphicsGetCurrentContext() // Apple wants this to be weak
        if let context:CGContext = context{
        context.saveGState()
        context.setBlendMode(CGBlendMode.destinationOut)
        "aaaaaaaaaa".draw(at: CGPoint.zero, withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 24)])
        context.restoreGState()
        }
    }
}
