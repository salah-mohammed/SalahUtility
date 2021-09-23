//
//  RetainCyclesExample.swift
//  SalahUtilityExample
//
//  Created by Salah on 9/23/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import Foundation
import UIKit
class Service{
    // weak used to prevent RetainCycles.
    weak var redController:RedController?
}
class RedController:UITableViewController{
    deinit {
        print("OS reclaiming memory for RedController");
    }
    let service = Service.init();
    override func viewDidLoad() {
        super.viewDidLoad();
        tableView.backgroundColor=UIColor.red;
        service.redController=self;
    }
}
