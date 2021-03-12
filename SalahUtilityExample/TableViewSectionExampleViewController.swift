//
//  TableViewSectionExampleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 3/8/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class TableViewSectionExampleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet var tableView: UITableView!
    
    var itemsInSections: Array<Array<String>> = [["1A", "1B", "1C"], ["2A", "2B"], ["3A", "3B", "3C", "3D", "3E"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return self.itemsInSections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsInSections[section].count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return  "\(section)"
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let label = UILabel(frame: CGRect.zero)
           label.textColor = UIColor.white
        label.backgroundColor = UIColor.red
        label.text="section\(section)"
           return label
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        var text = self.itemsInSections[indexPath.section][indexPath.row]
        
        cell.textLabel!.text = text
        
        return cell
    }

}
