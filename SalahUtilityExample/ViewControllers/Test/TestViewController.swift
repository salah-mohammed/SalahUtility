//
//  TestViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 11/16/20.
//  Copyright © 2020 Salah. All rights reserved.
//

import UIKit
import SalahUtility
import AVKit
import MediaPlayer

enum TestEnum:Int{
case enum1
case enum2
case enum3
    var value:String{
        switch self{
        case .enum1:
            return "enum1"
        case let enum2 where ((enum2 == .enum2) && (UIApplication.shared.delegate as! AppDelegate).newVariable == 0):
            return "enum2where0"
        case let enum2 where ((enum2 == .enum2) && (UIApplication.shared.delegate as! AppDelegate).newVariable == 1):
            return "enum2where1"
        case .enum3:
            return "enum3"
        case .enum2:
            return "enum2"
        }
    }
}
class TestViewController: UIViewController {
    var items:[String]=[String]();
    
//    @IBOutlet weak var airPlayView: UIView!
    var routerPickerView:AVRoutePickerView!;
    
    @IBOutlet weak var airPlayView: UIView!
    @IBOutlet weak var btnTest: UIButton!
    @IBOutlet weak var btnTest2: UIButton!
    var actions = [BaseAction]();

    deinit {
        print("deinit");
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(TestEnum.enum2.value)
        setupAirPlayButton();
  
        self.view.bs_longPress(&actions,config: { gesture in
            gesture.minimumPressDuration = 0.25
        }){ _, _ in
            print("a");
        }
        self.view.bs_tap(&actions){_, _ in
            print("tap")
        }
        btnTest.bs_action(.touchUpInside,&actions,{ a in
            print("touchUpInside");
        })
//        items.append("1");
//        items.append("2");
//
//        if let str2:String = items.bs_get(1) {
//            print(str2) // --> this still wouldn't run
//        } else {
//            print("No string found at that index") // --> this would be printed
//        }
//        // Do any additional setup after loading the view.
//
    }
    @IBAction func btnTest(_ sender:UIButton){
        print((self.view as? ABB)?.title ?? "");
//        ABB.appearance().title = "asd";
//        ABB.appearance().customeBackground=UIColor.blue;
        ABB.appearance().title="a";

        print((self.view as? ABB)?.title ?? "");
        self.routerPickerView.present();

//        self.navigationController?.navigationBar.bs_setTransparent(backgroundColor: nil, textAttributes: [:], tintColor: UIColor.blue)
//        ;
//        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
//            self.navigationController?.navigationBar.defaultStyle();
//
//        }
        //        UIImagePickerController().bs_setup()
//        self.bs_showMessageWithTitle(title: "", message:"", okHandler: nil, cancelHandler: nil, okTitle: nil, cancelTitle: nil);

//        repeat {
//            print("Test By Salah");
//        }while self != nil
//      var a1 = sender.bs_isSuperViewType(UITableView.self);
//      var a2 = sender.bs_isSuperViewType(UIView.self);
//        print(a1);
//        print(a2);
//
//        var b1 = sender.bs_isSuperViewExist(UIView.init());
//        var b2 = sender.bs_isSuperViewExist(self.view);
//          print(b1);
//          print(b2);
    }
    func setupAirPlayButton() {
        var buttonView: UIView = UIView()
        let buttonFrame = CGRect(x:0, y:0, width: 50, height: 50)
                
        if #available(iOS 11, *) {
            self.routerPickerView = AVRoutePickerView(frame: buttonFrame)
            buttonView.addSubview(routerPickerView)
            
            routerPickerView.tintColor = UIColor(named: "PrimaryColor")
            routerPickerView.activeTintColor = .white
            routerPickerView.prioritizesVideoDevices = true
        }else{
            let airplayButton = MPVolumeView(frame: buttonFrame)
            airplayButton.showsVolumeSlider = false
            buttonView = airplayButton
        }
        self.airPlayView.addSubview(buttonView)
    }
}

fileprivate extension AVRoutePickerView {
    func present() {
        let routePickerButton = subviews.first(where: { $0 is UIButton }) as? UIButton
        routePickerButton?.sendActions(for: .touchUpInside)
    }
}


class ABB:UIView
{
    @objc dynamic var title:String="a"
    
}

