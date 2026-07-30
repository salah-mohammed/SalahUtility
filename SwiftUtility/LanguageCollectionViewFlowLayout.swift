//
//  LanguageCollectionViewFlowLayout.swift
//  SwiftUtility
//
//  Created by Salah on 10/25/21.
//  Copyright © 2021 Salah. All rights reserved.
//
#if os(iOS)
import Foundation
import UIKit
open class LanguageCollectionViewFlowLayout:UICollectionViewFlowLayout{
    open override var flipsHorizontallyInOppositeLayoutDirection: Bool{
        return true;
    }
}
#endif
