//
//  URLExampleViewController.swift
//  SalahUtility
//
//  Created by Salah on 2/10/22.
//  Copyright © 2022 Salah. All rights reserved.
//

import UIKit
import SalahUtility
import SwiftUI
class URLExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alert.show(self, Alert.attention("message", { _,_ in
        }))
        
        var url = "https://vschoolcontent2.blob.core.windows.net/vschoolblob/TeacherRoom/324b7f0a-f67a-4eff-8ee8-c0bdf21d6bc0.jpg?sv=2020-08-04&st=2022-02-10T10%3A33%3A22Z&se=2022-02-10T10%3A48%3A22Z&sr=b&sp=r&sig=%2FQMqc3%2FugUxjrL21NLSqXYS5RBcaT1EQaQpuy0sfPOY%3D";
        
        var url1 = try? URL.init(string: url)?.absoluteString;
        var url2 = try? URL.init(string: url)?.path;
        var url3 = try? URL.init(string: url)?.pathExtension;
        var url4 = try? URL.init(string: url)?.pathComponents;
        var url5 = try? URL.init(string: url)?.relativePath;
        var url6 = try? URL.init(string: url)?.relativeString;
        var url7 = try? URL.init(string: url)?.absoluteURL;
        var url8 = try? URL.init(string: url)?.lastPathComponent;
        var url9 = try? URL.init(string: url)?.query;
        var url10 = try? URL.init(string: url)?.scheme;
        var url11 = try? URL.init(string: url)?.host;

        Debuger.shared.debugObject("url1 = \(url1 ?? "")")
        Debuger.shared.debugObject("url2 = \(url2 ?? "")")
        Debuger.shared.debugObject("url3 = \(url3 ?? "")")
        Debuger.shared.debugObject("url4 = \(url4 ?? [])")
        Debuger.shared.debugObject("url5 = \(url5 ?? "")")
        Debuger.shared.debugObject("url6 = \(url6 ?? "")")
        Debuger.shared.debugObject("url7 = \(String(describing:url7))")
        Debuger.shared.debugObject("url8 = \(url8 ?? "")")
        Debuger.shared.debugObject("url9 = \(url9 ?? "")")
        Debuger.shared.debugObject("url10 = \(url10 ?? "")")
        Debuger.shared.debugObject("url11 = \(url11 ?? "")")


        print(Debuger.shared.printItems())
//        Alert.show(self, .fieldRequired(<#T##String#>, <#T##((UIAlertAction) -> Void)?#>))
        // Do any additional setup after loading the view.
        
//        AScenarioManager<>.init().open1Screen(object1: aad);
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

class AScenarioManager:ScenarioManager{
    // MARK: - Start ViewController
    // MARK: - End ViewController
    var  object1:String?
    var  object2:String?
    func openScreen1(object1:String?){
        self.object1=object1
    }
    func openScreen2(object2:String?){
        self.object2=object2
    }
    func dismissScreen1(){
        self.object1=nil
    }
    func dismissScreen2(){
        self.object2=nil
    }
}


class ViewController1:UIViewController,ScenarioManagerScreen{
    var scenarioManager:AScenarioManager?
            
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


