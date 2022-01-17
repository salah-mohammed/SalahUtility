//
//  WebViewViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 1/17/22.
//  Copyright © 2022 Salah. All rights reserved.
//

import UIKit
import WebKit
class WebViewViewController: UIViewController {
    @IBOutlet weak var webView:WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.webView.loadHTMLWithLocalCSS("salah ali abel hameed shaker mohamed <br> صلاح علي عبد الحميد شاكر محمد شيشسيس");
        
//        let htmlString = """
//        <!doctype html>
//        <meta charset="utf-8"/>
//        <meta name="viewport" content="width=device-width, initial-scale=1">
//        <html>
//            <head>
//                <style>
//                    @font-face {
//
//                        font-family: 'Cairo-Regular';
//
//                        src: url("Cairo-Regular.ttf") format('truetype');
//
//                    }
//                    body {
//                        font-size: 36px;
//                        font-family: "Cairo-Regular"
//                        ...
//                    }
//                    ...
//                </style>
//            </head>
//            <body>
//                <div class="container">
//                    <div class="element">
//                        Hello, <span class="custom">WKWebView!<br>salah ali abel hameed shaker mohamed <br> صلاح علي عبد الحميد شاكر محمد شيشسيس</span>
//                    </div>
//                </div>
//            </body>
//        </html>
//        """

        let htmlString = """
    WKWebView!
    """
        webView.loadHTMLWithLocalCSS(htmlString);
        
        webView.isOpaque=false;
        // Do any additional setup after loading the view.
    }
}


extension WKWebView {
    func loadHTMLWithLocalCSS(_ string:String){
        if let cssPath = Bundle.main.path(forResource:"webView", ofType:"css"), cssPath.count > 0 {
            self.loadHTMLString(string.html(), baseURL: URL(fileURLWithPath: cssPath))
        }else{
            self.loadHTMLString(string.html(), baseURL: nil)
        }
    }
}
extension String{
    func html()-> String {
    let html = """
            <html dir="\(true ? "rtl" : "ltr")">
            <head>
            <link rel="stylesheet" type="text/css" href="webView.css">
            <meta name="viewport" content="initial-scale=1.0" />
            </head>
            <body>
            \(self)
            </body>
            </html>
            """
    return html
    }
}
