//
//  TestCollectionViewCell.swift
//  SalahUtilityExample
//
//  Created by Salah on 1/27/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblContent: UILabel!

    func config(_ item:Any){
        if let item:String = item as? String{
            self.lblContent.text=item;
        }
    }
}
