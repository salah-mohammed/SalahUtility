//
//  VerticallyCenteredTextView.swift
//  SalahUtility
//
//  Created by Salah on 11/21/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import Foundation
import UIKit
public class VerticallyCenteredTextView: UITextView {
    public override var text: String? {
        didSet {
            update();
        }
    }
    public override func layoutSubviews() {
        super.layoutSubviews();
        update();
    }
    func update(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.03) {
        self.bs_centerText();
        }
    }
}
