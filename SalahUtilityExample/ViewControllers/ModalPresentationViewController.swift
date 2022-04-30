//
//  ModalPresentationViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 4/27/22.
//  Copyright © 2022 Salah. All rights reserved.
//

import UIKit

class ModalPresentationViewController: UIViewController {
    @IBOutlet weak var btnModal1: UIButton!
    @IBOutlet weak var btnModal2: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
         
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    @IBAction func btnModal1(_ sender:Any?){
        var vc = Modal1ViewController();
        self.present(vc, animated: true);
        var vc3 = Modal3ViewController();
        vc.present(vc3, animated: true);
    }
    @IBAction func btnModal2(_ sender:Any?){
        var vc = Modal2ViewController();
        self.present(vc, animated: true);
        var vc3 = Modal3ViewController();
        vc.present(vc3, animated: true);
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
fileprivate class Modal1ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.red
        self.modalPresentationStyle = .overCurrentContext
    }
}
fileprivate class Modal2ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.green
        self.modalPresentationStyle = .fullScreen
    }
}
fileprivate class Modal3ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.blue
        self.modalPresentationStyle = .fullScreen
        
        let myFirstButton = UIButton()
        myFirstButton.setTitle("adasdasd", for: .normal);
        myFirstButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        myFirstButton.frame = CGRect(x: 15, y: 54, width: 300, height: 500)
        self.view.addSubview(myFirstButton)
    }
    @objc func pressed() {
        self.presentedViewController?.dismiss(animated: true, completion:nil);
    }
}
