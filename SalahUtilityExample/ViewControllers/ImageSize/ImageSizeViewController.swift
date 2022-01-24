//
//  ImageSizeViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 5/27/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit
import SalahUtility
class ImageSizeViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var originalImage = UIImage.init(named:"paper")!
         
//        var originalImageInfo = originalImage.pngData()?.bs_getSizeIn(.megabyte)
//         print((originalImageInfo?.1 ?? "")+"\n");
//
//
        var compressedImageData = originalImage.jpegData(compressionQuality:0.2);
//         var compressedImageInfo = compressedImageData?.bs_getSizeIn(.megabyte)
//          print(compressedImageInfo?.1);
//
         var compressedImage = UIImage.init(data: compressedImageData!);
          img.image = compressedImage
        
        Debuger.shared.debugLog(object:"originalPng " + (originalImage.pngData()?.bs_getSizeIn(.megabyte).1 ?? ""))
        Debuger.shared.debugLog(object:"originalJpg " + (originalImage.jpegData(compressionQuality:1.0)?.bs_getSizeIn(.megabyte).1 ?? ""))
        Debuger.shared.debugLog(object:"0.5Jpg " + (originalImage.jpegData(compressionQuality:0.5)?.bs_getSizeIn(.megabyte).1 ?? ""))
        Debuger.shared.debugLog(object:"0.2Jpg " + (compressedImageData?.bs_getSizeIn(.megabyte).1 ?? ""))

        
        var a =  Debuger.shared.printItems();
        print(a);
        print(a);

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
