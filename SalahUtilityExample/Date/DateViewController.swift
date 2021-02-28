//
//  DateViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 11/29/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit
import SalahUtility
class DateViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var objects:[String]=[String]();
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        var date = Date();
        date.addTimeInterval(180*60);
        let  first = "\(DateFormatter.Symbols.year)-\(DateFormatter.Symbols.month)-\(DateFormatter.Symbols.day) \(DateFormatter.Symbols.hour24System):\(DateFormatter.Symbols.minute):\(DateFormatter.Symbols.second)"
        
        let second = "\(DateFormatter.Symbols.year)-\(DateFormatter.Symbols.month)-\(DateFormatter.Symbols.day) \(DateFormatter.Symbols.hour12System):\(DateFormatter.Symbols.minute):\(DateFormatter.Symbols.second)"
        
        let thired = "\(DateFormatter.Symbols.year)-\(DateFormatter.Symbols.month)-\(DateFormatter.Symbols.day) \(DateFormatter.Symbols.hour12System):\(DateFormatter.Symbols.minute):\(DateFormatter.Symbols.second) \(DateFormatter.Symbols.clock12)"

         let hijriDateFormate = "\(DateFormatter.Symbols.day)-\(DateFormatter.Symbols.monthName)-\(DateFormatter.Symbols.year)";


        objects.append("24 sytem : \(date.bs_formatter(first))");
        objects.append("12 sytem : \(date.bs_formatter(second))");
        objects.append("12 sytem : \(date.bs_formatter(thired))");
        objects.append("islamic 24 sytem : \(date.bs_islamicFormatter(formate:first))");
        objects.append("islamic 12 sytem : \(date.bs_islamicFormatter(formate:second))");
        objects.append("islamic 24 sytem system locale: \(date.bs_islamicFormatter(formate:first,NSLocale.system))");
        objects.append("islamic 24 sytem current locale: \(date.bs_islamicFormatter(formate:first,Locale.current))");
        
        
        objects.append("islamic 24 sytem ar locale: \(date.bs_islamicFormatter(formate:hijriDateFormate,Locale.init(identifier:"ar")))");
        objects.append("islamic 24 sytem ar_sa locale: \(date.bs_islamicFormatter(formate:hijriDateFormate,Locale.init(identifier:"ar_SA")))");

        tableView.reloadData();
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item = objects[indexPath.row];
        var  cell =  tableView.dequeueReusableCell(withIdentifier:"cell")
        cell?.textLabel?.text=item;
        cell?.textLabel?.font=UIFont.systemFont(ofSize: 13);
        return cell as! UITableViewCell;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count;
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
