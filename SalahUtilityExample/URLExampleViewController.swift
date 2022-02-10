//
//  URLExampleViewController.swift
//  SalahUtility
//
//  Created by Salah on 2/10/22.
//  Copyright © 2022 Salah. All rights reserved.
//

import UIKit

class URLExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var url = "https://vschoolcontent2.blob.core.windows.net/vschoolblob/TeacherRoom/324b7f0a-f67a-4eff-8ee8-c0bdf21d6bc0.jpg?sv=2020-08-04&st=2022-02-10T10%3A33%3A22Z&se=2022-02-10T10%3A48%3A22Z&sr=b&sp=r&sig=%2FQMqc3%2FugUxjrL21NLSqXYS5RBcaT1EQaQpuy0sfPOY%3D";
        var url1 = try? URL.init(string: url)?.absoluteString;
        var url2 = try? URL.init(string: url)?.path;
        var url3 = try? URL.init(string: url)?.pathExtension;
        var url4 = try? URL.init(string: url)?.pathComponents;
        var url5 = try? URL.init(string: url)?.relativePath;
        var url6 = try? URL.init(string: url)?.relativeString;
        var url7 = try? URL.init(string: url)?.absoluteURL;
        var url8 = try? URL.init(string: url)?.lastPathComponent;
        var url19 = try? URL.init(string: url)?.query;
        var url20 = try? URL.init(string: url)?.scheme;
        var url21 = try? URL.init(string: url)?.host;

        print(url8);
        print(url8);

        // Do any additional setup after loading the view.
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
