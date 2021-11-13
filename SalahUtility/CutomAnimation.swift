//
//  CutomAnimation.swift
//  SalahUtility
//
//  Created by Salah on 11/11/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import Foundation
import UIKit
public protocol HighlightAnimatable: class {
    var settings: HighlightAnimatableSettings { get }
    func lockAnimation()
    func unlockAnimation()
    func highlight(_ touched: Bool)
    func highlight(_ touched: Bool, completion: ((Bool) -> Void)?)
}
public struct HighlightAnimatableSettings {
    public static var Settings = HighlightAnimatableSettings.init()
    var duration: TimeInterval=0.5
    var delay: TimeInterval=0.0
    var springDamping: CGFloat=1.0
    var springVelocity: CGFloat=0.0
    var options: UIView.AnimationOptions=[.allowUserInteraction]
    var transform: CGAffineTransform = .init(scaleX: 0.90, y: 0.90)
    public init(_ duration:TimeInterval?=nil,
         _ delay:TimeInterval?=nil,
         _ springDamping:CGFloat?=nil,
         _ springVelocity:CGFloat?=nil,
         _ options:UIView.AnimationOptions?=nil,
         _ transform:CGAffineTransform?=nil) {
        if let duration:TimeInterval=duration,
           let delay:TimeInterval=delay,
           let springDamping:CGFloat=springDamping,
           let springVelocity:CGFloat=springVelocity,
           let options:UIView.AnimationOptions=options,
           let transform:CGAffineTransform=transform{
            self.duration=duration
            self.delay=delay
            self.springDamping=springDamping
            self.springVelocity=springVelocity
            self.options=options
            self.transform=transform
        }
            
        }
}
public struct AssociatedKeys {
    static var highlightAnimation = "VIV_highlightAnimation"
    static var settingAnimation = "VIV_settingAnimation"

}

public extension HighlightAnimatable where Self: UIView {

    var animationAvailable: Bool {
        get { return (objc_getAssociatedObject(self, &AssociatedKeys.highlightAnimation) as? Bool) ?? true }
        set { objc_setAssociatedObject(self, &AssociatedKeys.highlightAnimation, newValue, .OBJC_ASSOCIATION_ASSIGN) }
    }
    
    var settings: HighlightAnimatableSettings {
        get { return (objc_getAssociatedObject(self, &AssociatedKeys.settingAnimation) as? HighlightAnimatableSettings) ?? HighlightAnimatableSettings.Settings }
        set { objc_setAssociatedObject(self, &AssociatedKeys.settingAnimation, newValue, .OBJC_ASSOCIATION_ASSIGN) }
    }

    func lockAnimation() {
        animationAvailable = false
        layer.removeAllAnimations()
    }

    func unlockAnimation() {
        animationAvailable = true
    }

    func highlight(_ touched: Bool) {
        highlight(touched, completion: nil)
    }

    func highlight(_ touched: Bool, completion: ((Bool) -> Void)?) {
        guard animationAvailable else { return }

        UIView.animate(withDuration: settings.duration,
                       delay: settings.delay,
                       usingSpringWithDamping: settings.springDamping,
                       initialSpringVelocity: settings.springVelocity,
                       options: settings.options,
                       animations: {
                        self.transform = touched ? self.settings.transform : .identity
        }, completion: completion)
    }

}
public class AnimatableView: UIView, HighlightAnimatable {

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        highlight(true)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        highlight(false)
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        highlight(false)
    }

}
public class AnimatableButton: UIButton, HighlightAnimatable {

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        highlight(true)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        highlight(false)
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        highlight(false)
    }

}
public class AnimatableImageView: UIImageView, HighlightAnimatable {

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        highlight(true)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        highlight(false)
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        highlight(false)
    }

}
