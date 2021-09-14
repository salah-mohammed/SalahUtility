//
//  BaseInheritance.swift
//  Jobs
//
//  Created by Salah on 11/14/18.
//  Copyright © 2018 Salah. All rights reserved.
//

#if os(iOS)
import Foundation
import UIKit

open class RoundedLabel: UILabel {
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2.0
    }
}

open class RoundedView: UIView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2.0
    }
}

open class RoundedUIImageView: UIImageView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2.0
    }
}

open class RoundedUIButton: UIButton {
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2.0
    }
}
#endif
