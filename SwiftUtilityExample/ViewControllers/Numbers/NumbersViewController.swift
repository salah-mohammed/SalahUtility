//
//  NumbersViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 3/19/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var ra = self.raation();
        print(ra);
    }

    func raation(_ size:CGSize=UIScreen.main.bounds.size)->CGSize{
        let baseWidthRation:CGFloat = size.width/size.height;
        let baseHeightRation:CGFloat = 1

        var widthRation:CGFloat = baseWidthRation;
        var heightRatio:CGFloat = baseHeightRation;
        
        var widthMultipliedValue:CGFloat = 1.0
        
        repeat{
        widthMultipliedValue=widthMultipliedValue+0.5
        widthRation = baseWidthRation*widthMultipliedValue
        heightRatio = baseHeightRation*widthMultipliedValue
        if widthMultipliedValue == 100{
        break;
        }
        }while((widthRation.bs_removeDecemal()?.bs_isFraction ?? false) || (heightRatio.bs_removeDecemal()?.bs_isFraction ?? false))
        
        return CGSize.init(width: widthRation, height:heightRatio)
    }
    
}
extension UIImage{
}
