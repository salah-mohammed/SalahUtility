//
//  Base64ImageViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 12/1/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class Base64ImageViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource:"TestImage", withExtension:"png"){
//            let url = try URL.init(fileURLWithPath: audioFilePath)
            if let data:Data = try? Data.init(contentsOf:url){
            var image = UIImage.init(data:data)
            if let  imageBase64:String = image?.pngData()?.base64EncodedString() {
            if let dataDecoded : Data = Data(base64Encoded:imageBase64, options: .ignoreUnknownCharacters){
            let decodedimage = UIImage(data: dataDecoded)
            self.img.image = decodedimage;
            }else{
                print("Error");
            }
            }else{
                print("Error");
            }
            }
        }else{
            
        }
        
  
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
