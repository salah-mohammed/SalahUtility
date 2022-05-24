//
//  SheetExampleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 11/16/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit
import SalahUtility
class SheetExampleViewController: SheetViewController {
    @IBOutlet weak var viewTop: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.clear
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor=UIColor.black.withAlphaComponent(0.3);
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.backgroundColor=UIColor.clear;
    }
    @IBAction func tapGesture(_ sender:UITapGestureRecognizer){
//        self.view.endEditing(true)
        self.displayError(message: "asd");
    }
    func displayError(message: String) {
        let controller = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        guard let alertWindow = UIApplication.shared.windows.last,
              alertWindow.windowLevel == UIWindow.Level(rawValue: 10000001.0) else {
            self.navigationController?.present(controller, animated: true, completion: nil)
          return
        }
        alertWindow.rootViewController?.present(controller, animated: true, completion: nil)
      }
    @IBAction func btnAddView(_ sender:UIView){
       var vieww = UITextField.init();
        vieww.delegate=self;
        vieww.backgroundColor=UIColor.red;
        vieww.translatesAutoresizingMaskIntoConstraints = false
        self.stackViewScrollViewContent.insertArrangedSubview(vieww, at: 0);
        stackViewScrollViewContent.addConstraint(NSLayoutConstraint(item: vieww, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant:100))
    }
    @IBAction func btnCancel(_ sender:UIView){
        self.dismiss(animated: true, completion: nil);
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
