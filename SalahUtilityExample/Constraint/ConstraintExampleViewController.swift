//
//  ConstraintExampleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 2/28/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class ConstraintExampleViewController: UIViewController {

    @IBOutlet weak var btnAdd: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        var customeSuperView=self.view as! UIView

//        // Do any additional setup after loading the view.
        
        /*
        // for view in viweController used when space from traling and from leading and from top and from bottom
        var newView1 = UIView.init();
        newView1.translatesAutoresizingMaskIntoConstraints = false
        newView1.backgroundColor=UIColor.red;
        customeSuperView.addSubview(newView1);

        customeSuperView.addConstraint(NSLayoutConstraint(item: newView1, attribute: .trailing, relatedBy: .equal, toItem: customeSuperView, attribute: .trailing, multiplier: 1, constant:-10))
        customeSuperView.addConstraint(NSLayoutConstraint(item: newView1, attribute: .leading, relatedBy: .equal, toItem: customeSuperView, attribute: .leading, multiplier: 1, constant:10))
        customeSuperView.addConstraint(NSLayoutConstraint(item: newView1, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1, constant:10))
        customeSuperView.addConstraint(NSLayoutConstraint(item: newView1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 131))
      */
        
        /*
        // when add view equal another view
        var newView2 = UIView();
        newView2.translatesAutoresizingMaskIntoConstraints = false
        newView2.backgroundColor=UIColor.blue
        customeSuperView.addSubview(newView2);
        NSLayoutConstraint.activate([
            customeSuperView.topAnchor.constraint(equalTo: newView2.topAnchor),
            customeSuperView.bottomAnchor.constraint(equalTo: newView2.bottomAnchor),
            customeSuperView.leadingAnchor.constraint(equalTo: newView2.leadingAnchor),
            customeSuperView.trailingAnchor.constraint(equalTo: newView2.trailingAnchor)
        ])
 */
        
        /*
        // when add view equal another view with spacing
        var newView3 = UIView();
        newView3.translatesAutoresizingMaskIntoConstraints = false
        newView3.backgroundColor=UIColor.orange
        customeSuperView.addSubview(newView3);
        NSLayoutConstraint.activate([
            customeSuperView.topAnchor.constraint(equalTo: newView3.topAnchor,constant:-100),
            customeSuperView.bottomAnchor.constraint(equalTo: newView3.bottomAnchor,constant:100),
            customeSuperView.leadingAnchor.constraint(equalTo: newView3.leadingAnchor,constant:-100),
            customeSuperView.trailingAnchor.constraint(equalTo: newView3.trailingAnchor,constant:100)
        ])
       */
        
        
        // for view in viweController used when space from traling and from leading and from top and from bottom
        var newView4 = UIView.init();
        newView4.translatesAutoresizingMaskIntoConstraints = false
        newView4.backgroundColor=UIColor.red;
        customeSuperView.addSubview(newView4);

        customeSuperView.addConstraint(NSLayoutConstraint(item: newView4, attribute: .trailing, relatedBy: .equal, toItem: customeSuperView, attribute: .trailing, multiplier: 1, constant:-10))
        customeSuperView.addConstraint(NSLayoutConstraint(item: newView4, attribute: .leading, relatedBy: .equal, toItem: customeSuperView, attribute: .leading, multiplier: 1, constant:10))
        customeSuperView.addConstraint(NSLayoutConstraint(item: newView4, attribute: .top, relatedBy: .equal, toItem:customeSuperView, attribute: .top, multiplier: 1, constant:255))
        customeSuperView.addConstraint(NSLayoutConstraint(item: newView4, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,multiplier: 1, constant: 131))
      
    }
    
    @IBAction func btnAdd(_ sender: Any) {

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
