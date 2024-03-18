//
//  AlertHostingController.swift
//  LMS
//
//  Created by SalahMohamed on 14/03/2024.
//  Copyright © 2024 t4edu. All rights reserved.
//
#if os(iOS)
import Foundation
import SwiftUI
@available(iOS 13.0, *)
open class AlertHostingController<Content> : UIHostingController<Content> where Content : View {
      
    open override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor=UIColor.clear
    }
    open override func awakeFromNib() {
        super.awakeFromNib();
        setupAlert();
    }
    public override init(rootView: Content) {
        super.init(rootView: rootView)
        self.modalPresentationStyle = .overFullScreen
    }
    func setupAlert(){
        if #available(iOS 13.0, *) {
            self.isModalInPresentation=false
        }
        self.modalPresentationStyle = .overFullScreen
    }
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor=UIColor.black.withAlphaComponent(0.6)
    }
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.view.backgroundColor=UIColor.clear
    }
    required public init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
}

#endif
